import 'package:file_management_project/features/admin/files/domain/params/change_file_params.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/change_file_number_cubit.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/files_cubit.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/system_groups_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                // final sharedPreferences = SharedPreferencesUtils();
                // await sharedPreferences.init();
                // var token = sharedPreferences.getToken();
                context
                    .read<ChangeFileNumberCubit>()
                    .emitChangeFile(ChangeFileNumParams(1));
                //      context.read<AddFileCubit>().emitAddFile(
                // LogInParams('email@gmail.com', '123@@password')
                // AddFilesParams(fileContent, token!));
              },
              child: Text("signUpp"),
            )
          ],
        ),
      );
}
