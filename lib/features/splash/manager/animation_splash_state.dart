part of 'animation_splash_cubit.dart';

@freezed
class AnimationSplashState with _$AnimationSplashState {
  const factory AnimationSplashState.initial() = _Initial;
  const factory AnimationSplashState.changeTextOpacity(double textOpacity) =
      _ChangeTextOpacity;
  const factory AnimationSplashState.changeFontSize(double fontSize) =
      _ChangeFontSize;
  const factory AnimationSplashState.changeContainerSizeAndOpacity(
          double containerSize, double containerOpacity) =
      _ChangeContainerSizeAndOpacity;
  const factory AnimationSplashState.completed() = _Completed;
}
