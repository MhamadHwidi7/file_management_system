import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/manager/cubit/selection_file_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/pages/show_group_file_screen.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_my_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/add_file_to_group_params.dart';
import 'package:file_management_project/features/user/group/presentation/manager/add_file_to_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/cubit/get_my_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/paginated_group_file_cubit.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelectGroupScreen extends StatefulWidget {
  final int fileId;

  const SelectGroupScreen({super.key, required this.fileId});
  @override
  State<SelectGroupScreen> createState() => _SelectGroupScreenState();
}

class _SelectGroupScreenState extends State<SelectGroupScreen> {
  @override
  void initState() {
    context.read<GetMyGroupCubit>().emitMyGroup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Group'),
      ),
      body: _buildGroupList(context),
    );
  }

  Widget _buildGroupList(BuildContext context) {
    return BlocConsumer<GetMyGroupCubit, GetMyGroupState<GetMyGroupEntity?>>(
      bloc: context.read<GetMyGroupCubit>(),
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) => Fluttertoast.showToast(
            msg: NetworkExceptions.getErrorMessage(exception),
            toastLength: Toast.LENGTH_LONG,
          ),
          success: (entity, canLoadMore) {
            context
                .read<GetMyGroupCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<GetMyGroupCubit>().canLoadMoreData) {
              context.read<GetMyGroupCubit>().refreshController.loadNoData();
            } else {
              context.read<GetMyGroupCubit>().refreshController.loadComplete();
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
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final pokemon = entity[index];
                  return SelectGroupTile(
                      fileId: widget.fileId, pokemon: pokemon);
                },
              ),
              refreshController:
                  context.read<GetMyGroupCubit>().refreshController,
              onLoading: () {
                context.read<GetMyGroupCubit>().emitMyGroup();
              },
            );
            // }
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

class SelectGroupTile extends StatelessWidget {
  const SelectGroupTile({
    Key? key,
    required this.fileId,
    required this.pokemon,
  }) : super(key: key);

  final int fileId;
  final GetMyGroupEntity? pokemon;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _showConfirmationDialog(context),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemon!.group.groupName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    size: 24, color: Colors.white),
              ],
            ),
          ),
        ),
      );

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => getIt<AddFileToGroupCubit>(),
          child: AlertDialog(
            title: const Text('Confirmation'),
            content: const Text(
                'Are you sure you want to add the file to this group?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              BlocListener<AddFileToGroupCubit, AddFileToGroupState>(
                listener: (context, state) {
                  state.whenOrNull(
                    error: (networkExceptions) => Fluttertoast.showToast(
                        msg: NetworkExceptions.getErrorMessage(
                            networkExceptions)),
                    success: (message) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) =>
                                            getIt<PaginatedGroupFileCubit>(),
                                      ),
                                      BlocProvider(
                                        create: (context) =>
                                            getIt<SelectionFileCubit>(),
                                      ),
                                    ],
                                    child: ShowGroupFileScreen(
                                      groupId: pokemon!.groupId,
                                      groupName: pokemon!.group.groupName,
                                    ),
                                  )));
                    },
                  );
                },
                child: BlocBuilder<AddFileToGroupCubit, AddFileToGroupState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return TextButton(
                          onPressed: () {
                            context
                                .read<AddFileToGroupCubit>()
                                .emitAddFileToGroup(AddFileToGroupParams(
                                    pokemon!.groupId, fileId));
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                      initial: () {
                        return TextButton(
                          onPressed: () {
                            context
                                .read<AddFileToGroupCubit>()
                                .emitAddFileToGroup(AddFileToGroupParams(
                                    pokemon!.groupId, fileId));
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                      success: (message) {
                        return const SizedBox.shrink();
                      },
                      loading: () => const CupertinoActivityIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
