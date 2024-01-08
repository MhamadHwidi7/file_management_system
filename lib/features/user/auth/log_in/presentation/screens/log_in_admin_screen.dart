import 'package:file_management_project/core/constants/color_pallete.dart';
import 'package:file_management_project/features/admin/auth/domain/params/log_in_params.dart';
import 'package:file_management_project/features/admin/auth/presentation/manager/log_in_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/widgets/bottom_nav_bar.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/widgets/auth_button.dart';
import 'package:file_management_project/features/user/files/presentation/manager/get_my_files_cubit.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginAdminScreen extends StatelessWidget {
  const LoginAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController con = TextEditingController();
    TextEditingController password = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<LogInAdminCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Sign in admin.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SizedBox(height: 20),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: buildInputDecoration('Email'),
                    controller: con,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: buildInputDecoration('Password'),
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LogInAdminCubit, LogInAdminState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return AuthButton(
                            text: 'Sign in admin',
                            onpressed: () {
                              context.read<LogInAdminCubit>().emitLogInAdmin(
                                  AdminLogInParams(con.text, password.text));
                            },
                          );
                        },
                        loading: () => const CupertinoActivityIndicator(),
                        initial: () {
                          return AuthButton(
                            text: 'Sign in admin',
                            onpressed: () {
                              context.read<LogInAdminCubit>().emitLogInAdmin(
                                  AdminLogInParams(con.text, password.text));
                            },
                          );
                        },
                        success: (adminLogInEntity) {
                          final adminName =
                              adminLogInEntity.adminLogInData.name;
                          final adminEmail =
                              adminLogInEntity.adminLogInData.email;
                          Future.delayed(
                            Duration.zero,
                            () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return BlocProvider(
                                    create: (context) =>
                                        getIt<GetMyFilesCubit>(),
                                    child: MyBottomNavigationBar(),
                                  );
                                },
                              ));
                            },
                          );
                          return const SizedBox.shrink();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Pallete.borderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Pallete.gradient2,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: hintText,
    );
  }
}
