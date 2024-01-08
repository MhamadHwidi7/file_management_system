import 'package:file_management_project/core/utils/shared_preferences_utils.dart';
import 'package:file_management_project/features/admin/auth/presentation/manager/log_in_cubit.dart';
import 'package:file_management_project/features/admin/auth/presentation/manager/sign_up_cubit.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/files_cubit.dart';
import 'package:file_management_project/features/splash/manager/animation_splash_cubit.dart';
import 'package:file_management_project/features/splash/pages/splash_screen.dart';
import 'package:file_management_project/features/user/auth/log_in/presentation/manager/log_in_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/manager/cubit/selection_file_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/widgets/bottom_nav_bar.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/log_in_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:file_management_project/features/user/files/presentation/manager/get_my_files_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/get_state_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/history_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/manager/reserve_file_cubit.dart';
import 'package:file_management_project/features/user/files/presentation/pages/show_all_file_system_screen.dart';
import 'package:file_management_project/features/user/group/presentation/manager/create_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/cubit/get_my_group_cubit.dart';
import 'package:file_management_project/features/user/group/presentation/manager/paginated_group_file_cubit.dart';
import 'bloc_observer.dart';
import 'injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await SharedPreferencesUtils().init();
  print(
      "ssssssssssssssssssssssssssssssssssssssssssssssssss+${SharedPreferencesUtils().getToken()}");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'File Management System',
        theme: ThemeData(
          // appBarTheme: AppBarTheme(color: Color(0)),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.black,
          ),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            // BlocProvider(
            //   create: (context) => getIt<SignUpCubit>(),
            // ),
            // BlocProvider(
            //   create: (context) => getIt<GetMyFilesCubit>(),
            // ),
            BlocProvider(
              create: (context) => getIt<HistoryFileCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<LogInAdminCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<LogInCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetMyGroupCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetStateFileCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetAllFilesSystemCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<PaginatedGroupFileCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<ReserveFileCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<AnimationSplashCubit>(),
            ),
          ],
          child: SplashScreen(),
        ),
      ),
    );
  }
}
