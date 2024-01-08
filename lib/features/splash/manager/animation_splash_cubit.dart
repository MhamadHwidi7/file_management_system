import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'animation_splash_state.dart';
part 'animation_splash_cubit.freezed.dart';

@injectable
class AnimationSplashCubit extends Cubit<AnimationSplashState> {
  late AnimationController _controller;
  late Timer _timer;
  AnimationSplashCubit() : super(const AnimationSplashState.initial()) {
    _controller = AnimationController(
      vsync: _SplashTickerProvider(),
      duration: const Duration(seconds: 3),
    )..addListener(_animationListener);
    _controller.forward();
    _timer = Timer(
      const Duration(seconds: 1),
      () {
        emit(const AnimationSplashState.changeTextOpacity(1.0));
      },
    );

    _timer = Timer(
      const Duration(seconds: 2),
      () {
        emit(const AnimationSplashState.changeContainerSizeAndOpacity(2, 1));
      },
    );
    _timer = Timer(
      const Duration(seconds: 3),
      () {
        emit(const AnimationSplashState.changeFontSize(20));
      },
    );
    _timer = Timer(
      const Duration(milliseconds: 3500),
      () {
        emit(const AnimationSplashState.completed());
      },
    );
  }
  @override
  Future<void> close() {
    _timer.cancel();
    _controller.dispose();
    return super.close();
  }

  void _animationListener() {
    if (_controller.status == AnimationStatus.completed) {
      state.mapOrNull(
        initial: (_) {
          _controller.reset();
          _controller.forward();
        },
      );
    }
  }

  AnimationController get animationController => _controller;
}

class _SplashTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
