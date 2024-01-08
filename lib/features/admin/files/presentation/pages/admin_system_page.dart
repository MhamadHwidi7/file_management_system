import 'package:file_management_project/features/admin/files/presentation/manager/files_cubit.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/system_groups_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/pages/show_all_group_in_system.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/pages/show_all_user_in_system.dart';
import 'package:file_management_project/features/user/files/presentation/pages/show_all_file_system_screen.dart';
import 'package:file_management_project/features/user/group/presentation/manager/get_all_user_system_cubit.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        ],
      ),
    );
  }
}
