import 'package:file_management_project/core/constants/color_pallete.dart';
import 'package:file_management_project/features/admin/auth/domain/params/sign_up_params.dart';
import 'package:file_management_project/features/admin/auth/presentation/manager/sign_up_cubit.dart';
import 'package:file_management_project/features/admin/auth/presentation/pages/log_in_admin_screen.dart';

import 'package:file_management_project/features/user/auth/sign_up/presentation/widgets/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpAdminScreen extends StatelessWidget {
  const SignUpAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
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
                  BlocBuilder<SignUpAdminCubit, SignUpAdminState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return AuthButton(
                            text: 'Sign up as Admin',
                            onpressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context
                                    .read<SignUpAdminCubit>()
                                    .emitRegisterAdmin(
                                      AdminSignUpParams(
                                        fullname.text,
                                        email.text,
                                        password.text,
                                      ),
                                    );
                              }
                            },
                          );
                        },
                        loading: () => const CupertinoActivityIndicator(),
                        initial: () {
                          return AuthButton(
                            text: 'Sign up as Admin',
                            onpressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context
                                    .read<SignUpAdminCubit>()
                                    .emitRegisterAdmin(
                                      AdminSignUpParams(
                                        fullname.text,
                                        email.text,
                                        password.text,
                                      ),
                                    );
                              }
                            },
                          );
                        },
                        success: () {
                          Future.delayed(
                            Duration.zero,
                            () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const LoginAdminScreen()));
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
