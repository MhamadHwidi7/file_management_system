import 'dart:io';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/files/domain/entites/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/add_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/delete_file_params.dart';
import 'package:file_management_project/features/user/files/presentation/manager/add_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/delete_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/get_my_files_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/history_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/pages/history_screen.dart';
import 'package:file_management_project/features/user/group/presentation/manager/cubit/get_my_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/screens/select_group_screen.dart';
import 'package:file_management_project/injection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({Key? key}) : super(key: key);

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  @override
  void initState() {
    context.read<GetMyFilesCubit>().emitGetMyFiles();
    super.initState();
  }

  void _refresh() {
    context.read<GetMyFilesCubit>().emitGetMyFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _pickCVFile(context);
        },
      ),
      body: _buildGetFiles(context),
    );
  }

  _buildGetFiles(BuildContext context) {
    return BlocBuilder<GetMyFilesCubit, GetMyFilesState<GetMyFilesEntity>>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: Text("Try again"),
          ),
          loading: () => const Center(child: CupertinoActivityIndicator()),
          success: (getMyFilesEntity) {
            return ListView.builder(
              itemCount: getMyFilesEntity.getMyFilesData.length,
              itemBuilder: (context, index) {
                final fileData = getMyFilesEntity.getMyFilesData[index];
                return FileTile(fileData: fileData);
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

  void _pickCVFile(BuildContext context) async {
    PermissionStatus permissionStatus = await Permission.storage.request();
    if (permissionStatus.isGranted) {
      try {
        final result = await FilePicker.platform.pickFiles();

        if (result != null && result.files.isNotEmpty) {
          PlatformFile file = result.files.first;
          String filePath = file.path ?? '';
          File pickedFile = File(filePath);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider(
                create: (context) => getIt<AddFileCubit>(),
                child: AlertDialog(
                  title: Text('File Picked'),
                  content: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('File Path: $filePath'),
                        SizedBox(height: 10),
                        Text('File Name: ${file.name}'),
                        SizedBox(height: 10),
                        Text('File Size: ${file.size} bytes'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    BlocProvider(
                      create: (context) => getIt<GetMyFilesCubit>(),
                      child: BlocListener<AddFileCubit, AddFileState>(
                        listener: (context, state) {
                          state.whenOrNull(
                            success: (addFilesEntity) {
                              _refresh();
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: BlocBuilder<AddFileCubit, AddFileState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return TextButton(
                                  onPressed: () {
                                    context.read<AddFileCubit>().emitAddFile(
                                        AddFilesParams(pickedFile));
                                  },
                                  child: Text('OK'),
                                );
                              },
                              initial: () {
                                return TextButton(
                                  onPressed: () {
                                    context.read<AddFileCubit>().emitAddFile(
                                        AddFilesParams(pickedFile));
                                  },
                                  child: Text('OK'),
                                );
                              },
                              success: (addFilesEntity) {
                                // Navigator.pop(context);
                                return SizedBox.shrink();
                              },
                              loading: () => const CupertinoActivityIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      } catch (e) {
        print('Error picking file: $e');
      }
    } else {
      print('Permission not granted to access storage.');
      Fluttertoast.showToast(
        msg: "Permission denied to access storage.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}

class FileTile extends StatefulWidget {
  const FileTile({
    Key? key,
    required this.fileData,
  }) : super(key: key);

  final GetMyFilesData fileData;

  @override
  State<FileTile> createState() => _FileTileState();
}

class _FileTileState extends State<FileTile> {
  void _refresh() {
    context.read<GetMyFilesCubit>().emitGetMyFiles();
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => getIt<HistoryFileCubit>(),
                child: HistoryScreen(
                  fileId: widget.fileData.fileId,
                ),
              ),
            ),
          );
        },
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.fileData.filePath,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      _showDeleteAlertDialog(context);
                    }
                    if (value == 'add to group') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                    create: (context) =>
                                        getIt<GetMyGroupCubit>(),
                                    child: SelectGroupScreen(
                                      fileId: widget.fileData.fileId,
                                    ),
                                  )));
                    }
                  },
                  itemBuilder: (BuildContext context) => const [
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete'),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'add to group',
                      child: ListTile(
                        leading: Icon(Icons.add),
                        title: Text('Add To Group'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  void _showDeleteAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => getIt<DeleteFileCubit>(),
          child: AlertDialog(
            title: Text('Delete File'),
            content: Text('Are you sure you want to delete ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              BlocListener<DeleteFileCubit, DeleteFileState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (message) {
                      Navigator.pop(context);
                      _refresh();
                    },
                  );
                },
                child: BlocBuilder<DeleteFileCubit, DeleteFileState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return TextButton(
                          onPressed: () {
                            context.read<DeleteFileCubit>().emitDeleteFile(
                                DeleteFileParams(widget.fileData.fileId));
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                      initial: () {
                        return TextButton(
                          onPressed: () {
                            context.read<DeleteFileCubit>().emitDeleteFile(
                                DeleteFileParams(widget.fileData.fileId));
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                      loading: () => const CupertinoActivityIndicator(),
                      success: (message) {
                        return const SizedBox.shrink();
                      },
                      error: (networkExceptions) => Center(
                        child: Text(NetworkExceptions.getErrorMessage(
                            networkExceptions)),
                      ),
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
