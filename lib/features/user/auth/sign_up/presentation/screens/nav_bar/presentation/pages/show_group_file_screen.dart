// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/manager/cubit/selection_file_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/pages/show_all_file_check_in_group_screen.dart';
import 'package:file_management_project/features/user/files/domain/params/check_in_params.dart';
import 'package:file_management_project/features/user/files/domain/params/check_out_params.dart';
import 'package:file_management_project/features/user/files/domain/params/download_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/file_state_params.dart';
import 'package:file_management_project/features/user/files/domain/params/read_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/save_file_params.dart';
import 'package:file_management_project/features/user/files/presentation/manager/cubit/download_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/get_state_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/read_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/reserve_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/save_file_cubit.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_all_user_in_group_entity.dart';
import 'package:file_management_project/features/user/group/presentation/manager/get_all_file_check_in_group_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/group/domain/entities/paginated_group_file.dart';
import 'package:file_management_project/features/user/group/domain/entities/users_system_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/add_user_to_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_file_from_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_user_from_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_user_in_group_params.dart';
import 'package:file_management_project/features/user/group/presentation/manager/add_user_to_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/delete_file_from_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/delete_user_from_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/get_all_user_in_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/get_all_user_system_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/paginated_group_file_cubit.dart';
import 'package:file_management_project/injection.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowGroupFileScreen extends StatefulWidget {
  final int groupId;
  final String groupName;
  const ShowGroupFileScreen({
    Key? key,
    required this.groupId,
    required this.groupName,
  }) : super(key: key);

  @override
  State<ShowGroupFileScreen> createState() => _ShowGroupFileScreenState();
}

class _ShowGroupFileScreenState extends State<ShowGroupFileScreen> {
  @override
  void initState() {
    context
        .read<PaginatedGroupFileCubit>()
        .emitGetGroupFilePaginated(groupId: widget.groupId);

    super.initState();
  }

  void _refresh() {
    context
        .read<PaginatedGroupFileCubit>()
        .emitGetGroupFilePaginated(groupId: widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    print(
        "sssswwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwrerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    return BlocProvider(
      create: (context) => getIt<ReserveFileCubit>(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.group),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (context) =>
                                getIt<GetAllUserInGroupCubit>(),
                            child: ShowUserGroupScreen(
                                groupName: widget.groupName,
                                groupId: widget.groupId),
                          )));
            }),
        appBar: AppBar(
          actions: [
            BlocConsumer<SelectionFileCubit, SelectionFileState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (message) {},
                );
              },
              bloc: context.read<SelectionFileCubit>(),
              builder: (context, state) {
                print(state);
                return state.maybeWhen(
                    initial: () {
                      return IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                        create: (context) => getIt<
                                            GetAllFileCheckInGroupCubit>(),
                                        child: ShowFileCheckInGroupScreen(
                                            groupId: widget.groupId))));
                          },
                          icon: const Icon(Icons.file_copy_outlined));
                    },
                    doneSelected: (selectedIDs) {
                      return IconButton(
                          onPressed: () {
                            context.read<ReserveFileCubit>().emitCheckInFile(
                                CheckInFileParams(selectedIDs, widget.groupId));

                            Future.delayed(Duration(milliseconds: 100), () {
                              context
                                  .read<SelectionFileCubit>()
                                  .clearSelectedFiles();
                            });
                          },
                          icon: const Icon(Icons.add));
                    },
                    orElse: () => const SizedBox.shrink());
              },
            ),
          ],
          title: const Text('File in group'),
        ),
        body: _buildGroupFileConsumer(context),
      ),
    );
  }

  Widget _buildGroupFileConsumer(BuildContext context) {
    return BlocConsumer<PaginatedGroupFileCubit,
        PaginatedGroupFileState<PaginatedGroupFileEntity?>>(
      bloc: context.read<PaginatedGroupFileCubit>(),
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) => Fluttertoast.showToast(
            msg: NetworkExceptions.getErrorMessage(exception),
            toastLength: Toast.LENGTH_LONG,
          ),
          success: (entity, canLoadMore) {
            context
                .read<PaginatedGroupFileCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<PaginatedGroupFileCubit>().canLoadMoreData) {
              context
                  .read<PaginatedGroupFileCubit>()
                  .refreshController
                  .loadNoData();
            } else {
              context
                  .read<PaginatedGroupFileCubit>()
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
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final pokemon = entity[index];
                  return BlocProvider(
                    create: (context) => getIt<GetStateFileCubit>(),
                    child: GroupFileTile(
                        groupId: widget.groupId, pokemon: pokemon),
                  );
                },
              ),
              refreshController:
                  context.read<PaginatedGroupFileCubit>().refreshController,
              onLoading: () {
                context
                    .read<PaginatedGroupFileCubit>()
                    .emitGetGroupFilePaginated(groupId: widget.groupId);
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

class GroupFileTile extends StatefulWidget {
  const GroupFileTile({
    Key? key,
    required this.groupId,
    required this.pokemon,
  }) : super(key: key);

  final int groupId;
  final PaginatedGroupFileEntity? pokemon;

  @override
  State<GroupFileTile> createState() => _GroupFileTileState();
}

class _GroupFileTileState extends State<GroupFileTile> {
  @override
  void initState() {
    context
        .read<GetStateFileCubit>()
        .emitGetFileState(FileStateParams(widget.pokemon!.id));
    super.initState();
  }

  void _refresh() {
    context
        .read<GetStateFileCubit>()
        .emitGetFileState(FileStateParams(widget.pokemon!.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionFileCubit, SelectionFileState>(
      builder: (context, state) {
        bool isSelected = state.maybeWhen(
          initial: () => false,
          doneSelected: (selectedIDs) =>
              selectedIDs.contains(widget.pokemon!.id),
          orElse: () => false,
        );

        return GestureDetector(
          onLongPress: () {
            context
                .read<SelectionFileCubit>()
                .emitSelectFilesToCheckIn(widget.pokemon!.id);
            if (isSelected) {
              // If already selected, unselect the file
              context
                  .read<SelectionFileCubit>()
                  .emitUnselectFilesToCheckIn(widget.pokemon!.id);
            } else {
              // If not selected, select the file (avoid duplicate entries)
              if (!context
                  .read<SelectionFileCubit>()
                  .files
                  .contains(widget.pokemon!.id)) {
                context
                    .read<SelectionFileCubit>()
                    .emitSelectFilesToCheckIn(widget.pokemon!.id);
              }
            }
          },
          child: Dismissible(
            key: Key(widget.pokemon!.path),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) async {
              if (direction == DismissDirection.endToStart) {
                await _showDeleteConfirmationDialog(context, widget.pokemon);
              }
            },
            background: Container(
              color: Colors.red,
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
              color: isSelected ? Colors.grey : null,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  title: Text(
                    widget.pokemon!.path,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: BlocBuilder<GetStateFileCubit, GetStateFileState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Text('loading'),
                          );
                        },
                        error: (networkExceptions) => Text(
                          NetworkExceptions.getErrorMessage(networkExceptions),
                        ),
                        loading: () {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Text('loading'),
                          );
                        },
                        success: (fileStateEntity) {
                          return Text(
                              fileStateEntity.fileData?.userData?.name ??
                                  "available");
                        },
                      );
                    },
                  ),
                  trailing: isSelected
                      ? Icon(
                          Icons.check,
                          color: const Color.fromARGB(255, 8, 255, 16),
                        )
                      : PopupMenuButton<String>(
                          onSelected: (value) {
                            _handlePopupMenuSelection(context, value);
                          },
                          itemBuilder: (BuildContext context) {
                            return {
                              'Check In',
                              'Check Out',
                              'Read File',
                              'Save File',
                              'Download File',
                            }.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice.replaceAll(' ', '').toLowerCase(),
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _handlePopupMenuSelection(
      BuildContext context, String value) async {
    final actions = {
      'checkin': () => _performCheckInAction(context),
      'checkout': () => _performCheckOutAction(context),
      'readfile': () => _performReadFileAction(context),
      'savefile': () => _performSaveFileAction(context),
      'downloadfile': () => _performDownloadFileAction(context),
    };

    final action = actions[value];
    action?.call();
  }

  Future<void> _performCheckInAction(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to check in ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<ReserveFileCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<PaginatedGroupFileCubit>(),
                ),
              ],
              child: BlocConsumer<ReserveFileCubit, ReserveFileState>(
                listener: (context, state) {
                  print(state);
                  state.whenOrNull(
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
                            context.read<ReserveFileCubit>().emitCheckInFile(
                                CheckInFileParams(
                                    [widget.pokemon!.id], widget.groupId));
                          },
                          child: const Text('OK'),
                        );
                      },
                      initial: () {
                        return TextButton(
                          onPressed: () {
                            context.read<ReserveFileCubit>().emitCheckInFile(
                                CheckInFileParams(
                                    [widget.pokemon!.id], widget.groupId));
                          },
                          child: const Text('OK'),
                        );
                      },
                      loading: () => const CupertinoActivityIndicator(),
                      success: (message) {
                        // Fluttertoast.showToast(
                        //     msg: message, toastLength: Toast.LENGTH_LONG);

                        ///todo:
                        return const SizedBox.shrink();
                      },
                      error: (networkExceptions) => Center(
                            child: Text(NetworkExceptions.getErrorMessage(
                                networkExceptions)),
                          ));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _performCheckOutAction(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to check out ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            BlocProvider(
              create: (context) => getIt<ReserveFileCubit>(),
              child: BlocConsumer<ReserveFileCubit, ReserveFileState>(
                listener: (context, state) {
                  print(state);
                  state.whenOrNull(
                    success: (message) {
                      _refresh();
                      Navigator.pop(context);
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () {
                        return TextButton(
                          onPressed: () {
                            context.read<ReserveFileCubit>().emitCheckOutFile(
                                CheckOutFileParams(widget.pokemon!.id));
                          },
                          child: const Text('OK'),
                        );
                      },
                      initial: () {
                        return TextButton(
                          onPressed: () {
                            context.read<ReserveFileCubit>().emitCheckOutFile(
                                CheckOutFileParams(widget.pokemon!.id));
                          },
                          child: const Text('OK'),
                        );
                      },
                      loading: () => const CupertinoActivityIndicator(),
                      success: (message) {
                        // Fluttertoast.showToast(
                        //     msg: message, toastLength: Toast.LENGTH_LONG);
                        // Navigator.pop(context);
                        return const SizedBox.shrink();
                      },
                      error: (networkExceptions) => Center(
                            child: Text(NetworkExceptions.getErrorMessage(
                                networkExceptions)),
                          ));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _performReadFileAction(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to read file ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            BlocProvider(
              create: (context) => getIt<ReadFileCubit>(),
              child: BlocBuilder<ReadFileCubit, ReadFileState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () {
                        return TextButton(
                          onPressed: () {
                            context.read<ReadFileCubit>().emitReadFile(
                                ReadFileParams(fileId: widget.pokemon!.id));
                          },
                          child: const Text('OK'),
                        );
                      },
                      initial: () {
                        return TextButton(
                          onPressed: () {
                            context.read<ReadFileCubit>().emitReadFile(
                                ReadFileParams(fileId: widget.pokemon!.id));
                          },
                          child: const Text('OK'),
                        );
                      },
                      loading: () => const CupertinoActivityIndicator(),
                      success: (message) {
                        // Fluttertoast.showToast(
                        //     msg: message, toastLength: Toast.LENGTH_LONG);
                        Navigator.pop(context);
                        return const SizedBox.shrink();
                      },
                      error: (networkExceptions) => Center(
                            child: Text(NetworkExceptions.getErrorMessage(
                                networkExceptions)),
                          ));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _performSaveFileAction(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to save file?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            BlocProvider(
              create: (context) => getIt<SaveFileCubit>(),
              child: BlocBuilder<SaveFileCubit, SaveFileState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          final directory =
                              await getApplicationDocumentsDirectory();
                          final filePath =
                              File('${directory.path}/${widget.pokemon!.path}');
                          context.read<SaveFileCubit>().emitSaveFile(
                                SaveFileParams(
                                  widget.pokemon!.id,
                                  filePath,
                                ),
                              );
                        },
                        child: const Text('OK'),
                      );
                    },
                    loading: () => const CupertinoActivityIndicator(),
                    success: (message) {
                      // Handle success
                      // Fluttertoast.showToast(
                      //     msg: message, toastLength: Toast.LENGTH_LONG);
                      Navigator.pop(context);
                      return const SizedBox.shrink();
                    },
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

  Future<void> _performDownloadFileAction(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to download file?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            BlocProvider(
              create: (context) => getIt<DownloadFileCubit>(),
              child: BlocListener<DownloadFileCubit, DownloadFileState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (savePath) {
                      Navigator.pop(context);
                    },
                  );
                  // TODO: implement listener
                },
                child: BlocBuilder<DownloadFileCubit, DownloadFileState>(
                  builder: (context, state) {
                    print(state);
                    return state.maybeWhen(
                      initial: () {
                        return TextButton(
                          onPressed: () async {
                            var documentsDirectory =
                                await getApplicationDocumentsDirectory();
                            String saveDirectory = documentsDirectory.path;
                            String savePath =
                                '$saveDirectory/${DateTime.now().millisecondsSinceEpoch}.jpg';

                            print('full path: $savePath');
                            context.read<DownloadFileCubit>().emitDownloadFile(
                                DownloadFileParams(
                                  fileId: widget.pokemon!.id,
                                ),
                                savePath);
                          },
                          child: const Text('OK'),
                        );
                      },
                      orElse: () {
                        return TextButton(
                          onPressed: () async {
                            var documentsDirectory =
                                await getApplicationDocumentsDirectory();
                            String saveDirectory = documentsDirectory.path;
                            String savePath =
                                '$saveDirectory/${DateTime.now().millisecondsSinceEpoch}.jpg';

                            print('full path: $savePath');
                            print('full path: $savePath');
                            context.read<DownloadFileCubit>().emitDownloadFile(
                                DownloadFileParams(
                                  fileId: widget.pokemon!.id,
                                ),
                                savePath);
                          },
                          child: const Text('OK'),
                        );
                      },
                      loading: () => const CupertinoActivityIndicator(),
                      success: (savePath) {
                        Uri uri = Uri.file(savePath);
                        print("File path: $uri");

                        // Open the file using url_launcher
                        launchUrl(uri);
                        return const SizedBox.shrink();
                      },
                      error: (networkExceptions) => Center(
                        child: Text(
                          NetworkExceptions.getErrorMessage(networkExceptions),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _showDeleteConfirmationDialog(
      BuildContext context, pokemon) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => getIt<DeleteFileFromGroupCubit>(),
          child: AlertDialog(
            title: const Text('Confirmation'),
            content: Text(
                'Are you sure you want to delete the file: ${pokemon!.path}?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // User canceled
                },
                child: const Text('Cancel'),
              ),
              BlocBuilder<DeleteFileFromGroupCubit, DeleteFileFromGroupState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return TextButton(
                        onPressed: () {
                          context
                              .read<DeleteFileFromGroupCubit>()
                              .emitDeleteFileFromGroup(
                                  DeleteFileFromGroupParams(
                                      widget.groupId, pokemon!.id));
                        },
                        child: const Text('Delete'),
                      );
                    },
                    initial: () {
                      return TextButton(
                        onPressed: () {
                          context
                              .read<DeleteFileFromGroupCubit>()
                              .emitDeleteFileFromGroup(
                                  DeleteFileFromGroupParams(
                                      widget.groupId, pokemon!.id));
                        },
                        child: const Text('Delete'),
                      );
                    },
                    loading: () => const CupertinoActivityIndicator(),
                    success: (message) {
                      Navigator.pop(context);
                      return const SizedBox.shrink();
                    },
                    // error: (networkExceptions) =>
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShowAllUserInSystemToAddScreen extends StatefulWidget {
  final String groupName;
  final int groupId;
  const ShowAllUserInSystemToAddScreen({
    Key? key,
    required this.groupName,
    required this.groupId,
  }) : super(key: key);

  @override
  State<ShowAllUserInSystemToAddScreen> createState() =>
      _ShowAllUserInSystemToAddScreenState();
}

class _ShowAllUserInSystemToAddScreenState
    extends State<ShowAllUserInSystemToAddScreen> {
  @override
  void initState() {
    context.read<GetAllUserSystemCubit>().emitGetAllUsersSystem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Files Screen'),
      ),
      body: _buildAllFilesConsumer(),
    );
  }

  Widget _buildAllFilesConsumer() {
    return BlocConsumer<GetAllUserSystemCubit,
        GetAllUserSystemState<UsersSystemEntity?>>(
      bloc: context.read<GetAllUserSystemCubit>(),
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) => Fluttertoast.showToast(
            msg: NetworkExceptions.getErrorMessage(exception),
            toastLength: Toast.LENGTH_LONG,
          ),
          success: (entity, canLoadMore) {
            context
                .read<GetAllUserSystemCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<GetAllUserSystemCubit>().canLoadMoreData) {
              context
                  .read<GetAllUserSystemCubit>()
                  .refreshController
                  .loadNoData();
            } else {
              context
                  .read<GetAllUserSystemCubit>()
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
                  return AllUsersSystemTileAdd(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      pokemon: pokemon);
                },
              ),
              refreshController:
                  context.read<GetAllUserSystemCubit>().refreshController,
              onLoading: () {
                context.read<GetAllUserSystemCubit>().emitGetAllUsersSystem();
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

class AllUsersSystemTileAdd extends StatelessWidget {
  final String groupName;
  final int groupId;
  const AllUsersSystemTileAdd({
    Key? key,
    required this.groupName,
    required this.groupId,
    required this.pokemon,
  }) : super(key: key);

  final UsersSystemEntity? pokemon;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            pokemon!.userName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            pokemon!.email,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: _buildAddButton(context),
        ),
      );

  Widget _buildAddButton(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddUserToGroupCubit>(),
      child: BlocBuilder<AddUserToGroupCubit, AddUserToGroupState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return IconButton(
                icon: Icon(Icons.add, color: Colors.blue),
                onPressed: () {
                  _showAddUserConfirmationDialog(context, pokemon!);
                },
              );
            },
            loading: () {
              return SizedBox(
                width: 24,
                height: 24,
                child: CupertinoActivityIndicator(),
              );
            },
            success: (message) {
              return const SizedBox.shrink();
            },
            error: (networkExceptions) {
              return IconButton(
                icon: Icon(Icons.add, color: Colors.red),
                onPressed: () {
                  _showAddUserConfirmationDialog(context, pokemon!);
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showAddUserConfirmationDialog(
    BuildContext context,
    UsersSystemEntity user,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirmation',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you sure you want to add the following user to the group?',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                _buildUserInfo('User', user.userName),
                _buildUserInfo('Email', user.email),
                _buildUserInfo('Group', groupName),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // User canceled
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            BlocProvider(
              create: (context) => getIt<AddUserToGroupCubit>(),
              child: BlocBuilder<AddUserToGroupCubit, AddUserToGroupState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return TextButton(
                        onPressed: () {
                          context
                              .read<AddUserToGroupCubit>()
                              .emitAddUserToGroup(
                                  AddUserToGroupParams(user.userId, groupId));
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.green),
                        ),
                      );
                    },
                    loading: () {
                      return SizedBox(
                        width: 24,
                        height: 24,
                        child: CupertinoActivityIndicator(),
                      );
                    },
                    error: (networkExceptions) {
                      return TextButton(
                        onPressed: () {
                          context
                              .read<AddUserToGroupCubit>()
                              .emitAddUserToGroup(
                                  AddUserToGroupParams(user.userId, groupId));
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                    success: (message) {
                      Navigator.pop(context);
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUserInfo(String label, String value) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 14),
        children: [
          TextSpan(
            text: '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class ShowUserGroupScreen extends StatefulWidget {
  final int groupId;
  final String groupName;
  const ShowUserGroupScreen({
    Key? key,
    required this.groupId,
    required this.groupName,
  }) : super(key: key);

  @override
  State<ShowUserGroupScreen> createState() => _ShowUserGroupScreenState();
}

class _ShowUserGroupScreenState extends State<ShowUserGroupScreen> {
  @override
  void initState() {
    context
        .read<GetAllUserInGroupCubit>()
        .emitGetAllUserInGroup(GetAllUserInGroupParams(widget.groupId));
    super.initState();
  }

  void _refresh() {
    context
        .read<GetAllUserInGroupCubit>()
        .emitGetAllUserInGroup(GetAllUserInGroupParams(widget.groupId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider(
                          create: (context) => getIt<GetAllUserSystemCubit>(),
                          child: ShowAllUserInSystemToAddScreen(
                              groupId: widget.groupId,
                              groupName: widget.groupName),
                        )));
          },
          child: Icon(Icons.group_add_sharp)),
      appBar: AppBar(
        title: Text('All Users in This Group'),
      ),
      body: BlocBuilder<GetAllUserInGroupCubit, GetAllUserInGroupState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CupertinoActivityIndicator()),
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (users) {
              return ListView.builder(
                itemCount: users.user.length,
                itemBuilder: (context, index) {
                  final user = users.user[index];
                  return _buildUserCard(user);
                },
              );
            },
            error: (networkExceptions) => Center(
              child: Text(NetworkExceptions.getErrorMessage(networkExceptions)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserCard(UserDataObject user) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          user.userMap.userName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          'ID: ${user.userId}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: _buildPopupMenu(user.userId),
      ),
    );
  }

  Widget _buildPopupMenu(int userId) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'delete') {
          _showDeleteConfirmationDialog(context, userId);
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'delete',
          child: ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _showDeleteConfirmationDialog(
      BuildContext context, int userId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Text('Are you sure you want to delete the user: $userId?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // User canceled
              },
              child: const Text('Cancel'),
            ),
            BlocProvider(
              create: (context) => getIt<DeleteUserFromGroupCubit>(),
              child: BlocConsumer<DeleteUserFromGroupCubit,
                  DeleteUserFromGroupState>(
                listener: (context, state) => state.whenOrNull(
                  success: (message) {
                    _refresh();
                    Navigator.pop(context);
                  },
                ),
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return TextButton(
                        onPressed: () {
                          context
                              .read<DeleteUserFromGroupCubit>()
                              .emitDeleteUserFromGroup(
                                  DeleteUserFromGroupParams(
                                      userId, widget.groupId));
                        },
                        child: const Text('Delete'),
                      );
                    },
                    initial: () {
                      return TextButton(
                        onPressed: () {
                          context
                              .read<DeleteUserFromGroupCubit>()
                              .emitDeleteUserFromGroup(
                                  DeleteUserFromGroupParams(
                                      widget.groupId, userId));
                        },
                        child: const Text('Delete'),
                      );
                    },
                    loading: () => const CupertinoActivityIndicator(),
                    success: (message) {
                      //  Navigator.pop(context);
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
