import '../../../sign_up/domain/params/sign_up_params.dart';
import '../../../sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                context.read<SignUpCubit>().emitSignUpUser(
                    SignUpParams('name', 'email@gmail.com', '123@@password'));
              },
              child: Text("signUpp"),
            )
          ],
        ),
      );
}
