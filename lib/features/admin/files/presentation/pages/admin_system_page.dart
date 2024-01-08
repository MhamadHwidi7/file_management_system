import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/shared_preferences_utils.dart';
import 'package:file_management_project/features/admin/files/domain/params/change_file_params.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/change_file_number_cubit.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/files_cubit.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/system_groups_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/pages/show_all_group_in_system.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/pages/show_all_user_in_system.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:file_management_project/features/user/files/presentation/pages/show_all_file_system_screen.dart';
import 'package:file_management_project/features/user/group/presentation/manager/get_all_user_system_cubit.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminSystem extends StatelessWidget {
  const AdminSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              _buildAlertDialog(context);
            },
            color: Colors.blue, // Add elevation for a material-like effect

            child: const Text('Enable Change File'),
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => getIt<GetAllFilesSystemCubit>(),
                    child: const ShowAllFileInSystemScreen(),
                  ),
                ),
              );
            },
            color: Colors.blue, // Add elevation for a material-like effect

            child: const Text('Show All File In System'),
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => getIt<GetAllUserSystemCubit>(),
                    child: ShowAllUserInSystemScreen(),
                  ),
                ),
              );
            },
            color: Colors.green,
            child: const Text('Show All User In System'),
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => getIt<SystemGroupsCubit>(),
                    child: ShowAllGroupInSystemScreen(),
                  ),
                ),
              );
            },
            color: Colors.orange,
            child: const Text('Show All Group In System'),
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoButton(
            onPressed: () {
              SharedPreferencesUtils().removeToken();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (context) => getIt<SignUpCubit>(),
                            child: SignUpScreen(),
                          )));
            },
            color: Colors.redAccent, // Add elevation for a material-like effect

            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }

  Future<void> _buildAlertDialog(BuildContext context) async {
    TextEditingController changeFileNumController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change File Number '),
          content: TextFormField(
            keyboardType: TextInputType.number,
            controller: changeFileNumController,
            decoration: const InputDecoration(
              hintText: 'Change File Number',
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
              create: (context) => getIt<ChangeFileNumberCubit>(),
              child: BlocConsumer<ChangeFileNumberCubit, ChangeFileNumberState>(
                listener: (context, state) {
                  state.whenOrNull(
                    error: (NetworkExceptions exception) =>
                        Fluttertoast.showToast(
                      msg: NetworkExceptions.getErrorMessage(exception),
                      toastLength: Toast.LENGTH_LONG,
                    ),
                    success: (message) {
                      // _refresh();
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
                          context.read<ChangeFileNumberCubit>().emitChangeFile(
                              ChangeFileNumParams(
                                  int.parse(changeFileNumController.text)));
                        },
                        child: const Text('Add'),
                      );
                    },
                    initial: () {
                      return TextButton(
                        onPressed: () {
                          context.read<ChangeFileNumberCubit>().emitChangeFile(
                              ChangeFileNumParams(
                                  int.parse(changeFileNumController.text)));
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
}
