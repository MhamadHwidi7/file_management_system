import 'dart:async';

import 'package:file_management_project/core/utils/page_transition.dart';
import 'package:file_management_project/core/utils/shared_preferences_utils.dart';
import 'package:file_management_project/features/splash/manager/animation_splash_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/widgets/bottom_nav_bar.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();
    context.read<AnimationSplashCubit>().animationController;
    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
      parent: context.read<AnimationSplashCubit>().animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _containerSize = 1.5;
    double _textOpacity = 0.0;
    double _containerOpacity = 0.0;
    double _fontSize = 2;

    return BlocBuilder<AnimationSplashCubit, AnimationSplashState>(
      builder: (context, state) {
        if (kDebugMode) {
          print('BlocBuilder is rebuilding with state: $state');
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: _height / _fontSize,
                  ),
                  state.maybeWhen(
                    changeTextOpacity: (textOpacity) =>
                        _buildChangeTextOpacity(textOpacity),
                    changeFontSize: (fontSize) {
                      return _buildChangeFontSize(
                          _width, _containerSize, fontSize);
                    },
                    changeContainerSizeAndOpacity:
                        (containerSize, containerOpacity) {
                      _containerSize = containerSize;
                      _containerOpacity = containerOpacity;
                      return _buildChangeContainerSizeAndOpacity(_textOpacity);
                    },
                    completed: () {
                      Future.delayed(const Duration(seconds: 1), () {
                        ///todo : make auto_route is perfect than these
                        navigateBasedOnToken(context);
                      });
                      return const SizedBox.shrink();
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  opacity: _containerOpacity,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: _width / _containerSize,
                      width: _width / _containerSize,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ScreenUtil().deviceType == DeviceType.mobile
                          ? FlutterLogo(
                              size: 80.h,
                            )
                          : FlutterLogo(
                              size: 120.h,
                            )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateBasedOnToken(BuildContext context) async {
    String? token = SharedPreferencesUtils().getToken();

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
          context, PageTransition(const MyBottomNavigationBar()));
    } else {
      // If no token, navigate to SignUpScreen
      Navigator.pushReplacement(
          context,
          PageTransition(BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: SignUpScreen(),
          )));
    }
  }

  AnimatedOpacity _buildChangeContainerSizeAndOpacity(double _textOpacity) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: _textOpacity,
      child: Text(
        'File Management System',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
    );
  }

  Column _buildChangeFontSize(
      double _width, double _containerSize, double fontSize) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          height: _width / _containerSize,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: Text(
              'File Management System',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  AnimatedOpacity _buildChangeTextOpacity(double textOpacity) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: textOpacity,
      child: Text(
        'File Management System',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
