// ignore_for_file: prefer_const_constructors

import 'package:file_management_project/features/admin/files/presentation/pages/admin_system_page.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/manager/navigation_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/get_my_files_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/pages/file_screen.dart';
import 'package:file_management_project/features/user/group/presentation/manager/cubit/get_just_my_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/screens/group_screen.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      BlocProvider(
        create: (context) => getIt<GetMyFilesCubit>(),
        child: FilesScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<GetJustMyGroupCubit>(),
        child: GroupScreen(),
      ),
      AdminSystem(),
    ];

    int _currentIndex = 0;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NavigationCubit>(),
        ),
      ],
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.blueAccent,
            ),
            body: _screens[_currentIndex],
            bottomNavigationBar: SalomonBottomBar(
                currentIndex: _currentIndex,
                onTap: (p0) {
                  context.read<NavigationCubit>().updatePage(p0);
                  _currentIndex = p0;
                },
                items: [
                  SalomonBottomBarItem(
                      icon: Icon(Icons.file_copy_sharp),
                      title: Text('Files'),
                      selectedColor: Colors.black),
                  SalomonBottomBarItem(
                      icon: Icon(Icons.groups),
                      title: Text('Groups'),
                      unselectedColor: Colors.black),
                  SalomonBottomBarItem(
                      icon: Icon(Icons.settings),
                      title: Text('Setting'),
                      unselectedColor: Colors.black),
                ]),
          );
        },
      ),
    );
  }
}
