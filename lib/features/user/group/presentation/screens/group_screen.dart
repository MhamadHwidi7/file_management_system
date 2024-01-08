import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/manager/cubit/selection_file_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/pages/show_group_file_screen.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_my_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/create_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_group_params.dart';
import 'package:file_management_project/features/user/group/presentation/manager/create_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/cubit/get_just_my_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/delete_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/paginated_group_file_cubit.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    context.read<GetJustMyGroupCubit>().emitMyGroup();
    super.initState();
  }

  void _refresh() {
    context.read<GetJustMyGroupCubit>().emitMyGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _buildAlertDialog(context);
        },
      ),
      body: _buildFilesConsumer(context),
    );
  }

  Future<void> _buildAlertDialog(BuildContext context) async {
    TextEditingController groupNameController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Group'),
          content: TextFormField(
            controller: groupNameController,
            decoration: const InputDecoration(
              hintText: 'Enter Group Name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            BlocProvider(
              create: (context) => getIt<CreateGroupCubit>(),
              child: BlocConsumer<CreateGroupCubit, CreateGroupState>(
                listener: (context, state) {
                  state.whenOrNull(
                    error: (NetworkExceptions exception) =>
                        Fluttertoast.showToast(
                      msg: NetworkExceptions.getErrorMessage(exception),
                      toastLength: Toast.LENGTH_LONG,
                    ),
                    success: (message) {
                      _refresh();
                      Navigator.pop(context);
                    },
                  );
                },
                builder: (context, state) {
                  print(state);
                  return state.maybeWhen(
                    orElse: () {
                      return TextButton(
                        onPressed: () {
                          context.read<CreateGroupCubit>().emitCreateGroup(
                              CreateGroupParams(groupNameController.text));
                        },
                        child: const Text('Add'),
                      );
                    },
                    initial: () {
                      return TextButton(
                        onPressed: () {
                          context.read<CreateGroupCubit>().emitCreateGroup(
                              CreateGroupParams(groupNameController.text));
                        },
                        child: const Text('Add'),
                      );
                    },
                    success: (message) {
                      return const SizedBox.shrink();
                    },
                    loading: () => const CupertinoActivityIndicator(),
                    error: (networkExceptions) => Center(
                      child: Text(
                        NetworkExceptions.getErrorMessage(networkExceptions),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilesConsumer(BuildContext context) {
    return BlocConsumer<GetJustMyGroupCubit,
        GetJustMyGroupState<GetMyGroupEntity?>>(
      bloc: context.read<
          GetJustMyGroupCubit>(), // Use context.read to get the cubit instance
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) => Fluttertoast.showToast(
            msg: NetworkExceptions.getErrorMessage(exception),
            toastLength: Toast.LENGTH_LONG,
          ),
          success: (entity, canLoadMore) {
            context
                .read<GetJustMyGroupCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<GetJustMyGroupCubit>().canLoadMoreData) {
              context
                  .read<GetJustMyGroupCubit>()
                  .refreshController
                  .loadNoData();
            } else {
              context
                  .read<GetJustMyGroupCubit>()
                  .refreshController
                  .loadComplete();
            }
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Text('Try again');
          },
          loading: () => const Center(child: CupertinoActivityIndicator()),
          success: (entity, _) {
            return CustomPaginationWidget(
              listTobePaginated: ListView.builder(
                itemCount: entity.length,
                itemBuilder: (context, index) {
                  final pokemon = entity[index];
                  return GroupTile(
                      groupId: pokemon!.groupId,
                      groupName: pokemon.group.groupName);
                },
              ),
              refreshController:
                  context.read<GetJustMyGroupCubit>().refreshController,
              onLoading: () {
                context.read<GetJustMyGroupCubit>().emitMyGroup();
              },
            );
          },
          error: (exception) => Center(
            child: Text(
              NetworkExceptions.getErrorMessage(exception),
            ),
          ),
        );
      },
    );
  }
}

class GroupTile extends StatelessWidget {
  const GroupTile({
    Key? key,
    required this.groupName,
    required this.groupId,
  }) : super(key: key);

  final String groupName;
  final int groupId;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: () => _navigateToShowGroupFileScreen(context),
        title: Text(
          groupName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing: _buildPopupMenu(context),
      ),
    );
  }

  void _navigateToShowGroupFileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<PaginatedGroupFileCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<SelectionFileCubit>(),
            ),
          ],
          child: ShowGroupFileScreen(
            groupName: groupName,
            groupId: groupId,
          ),
        ),
      ),
    );
  }

  Widget _buildPopupMenu(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'delete') {
          _showDeleteConfirmationDialog(context);
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'Delete Group',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final refreshGroupCubit = context.read<GetJustMyGroupCubit>();

    return showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: getIt<DeleteGroupCubit>(),
        child: BlocConsumer<DeleteGroupCubit, DeleteGroupState>(
          listener: (context, state) => state.whenOrNull(
            error: (networkExceptions) => Fluttertoast.showToast(
                msg: NetworkExceptions.getErrorMessage(networkExceptions)),
            success: (message) {
              ///todo:make show delete when sucess and refresh the list
              refreshGroupCubit

                  ///todo:not work success
                  .emitMyGroup(); // Fluttertoast.showToast(msg: message);
              Navigator.pop(context);
            },
          ),
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return AlertDialog(
                  title: Text('Delete Group'),
                  content: Text('Are you sure you want to delete the group?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<DeleteGroupCubit>()
                            .emitDeleteGroup(DeleteGroupParams(groupId));
                        Navigator.pop(context);
                      },
                      child:
                          Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              },
              initial: () {
                return AlertDialog(
                  title: Text('Delete Group'),
                  content: Text('Are you sure you want to delete the group?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<DeleteGroupCubit>()
                            .emitDeleteGroup(DeleteGroupParams(groupId));
                        Navigator.pop(context);
                      },
                      child:
                          Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              },
              loading: () => const CupertinoActivityIndicator(),
              success: (message) {
                //Navigator.pop(context);
                return const SizedBox.shrink();
              },
              error: (networkExceptions) => Center(
                  child: Text(
                      NetworkExceptions.getErrorMessage(networkExceptions))),
            );
          },
        ),
      ),
    );
  }
}
