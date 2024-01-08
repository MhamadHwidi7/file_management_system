import 'package:file_management_project/core/constants/color_pallete.dart';
import 'package:file_management_project/features/admin/auth/domain/params/sign_up_params.dart';
import 'package:file_management_project/features/admin/auth/presentation/manager/log_in_cubit.dart';
import 'package:file_management_project/features/admin/auth/presentation/manager/sign_up_cubit.dart';
import 'package:file_management_project/features/admin/auth/presentation/pages/log_in_admin_screen.dart';
import 'package:file_management_project/features/admin/auth/presentation/pages/sign_up_admin_screen.dart';
import 'package:file_management_project/features/user/auth/log_in/presentation/manager/log_in_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/params/sign_up_params.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/log_in_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/widgets/auth_button.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/widgets/auth_field.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Sign up.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: fullname,
                    decoration: buildInputDecoration('full Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: email,
                    decoration: buildInputDecoration('Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    decoration: buildInputDecoration('Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () => const CupertinoActivityIndicator(),
                        orElse: () {
                          return AuthButton(
                            text: 'Sign up',
                            onpressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context
                                    .read<SignUpCubit>()
                                    .emitSignUpUser(SignUpParams(
                                      fullname.text,
                                      email.text,
                                      password.text,
                                    ));
                              }
                            },
                          );
                        },
                        initial: () {
                          return AuthButton(
                            text: 'Sign up',
                            onpressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context
                                    .read<SignUpCubit>()
                                    .emitSignUpUser(SignUpParams(
                                      fullname.text,
                                      email.text,
                                      password.text,
                                    ));
                              }
                            },
                          );
                        },
                        success: (signUpEntity) {
                          Future.delayed(
                            Duration.zero,
                            () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()));
                            },
                          );
                          return const SizedBox.shrink();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthButton(
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) =>
                                          getIt<SignUpAdminCubit>(),
                                      child: const SignUpAdminScreen(),
                                    )));
                      },
                      text: "Sign Up As Admin"),
                  const SizedBox(height: 20),
                  const Text(
                    'or u have admin account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                    create: (context) =>
                                        getIt<LogInAdminCubit>(),
                                    child: const LoginAdminScreen(),
                                  )));
                    },
                    child: Text("Sign in As Admin"),
                    color: Colors.amberAccent,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'or u have user account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) => getIt<LogInCubit>(),
                                      child: const LoginScreen(),
                                    )));
                      },
                      child: Text("Sign in As User"),
                      color: Colors.lightGreen),
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
