part of 'sign_up_cubit.dart';

@freezed
class SignUpAdminState with _$SignUpAdminState {
  const factory SignUpAdminState.initial() = _Initial;
  const factory SignUpAdminState.loading() = _Loading;
  const factory SignUpAdminState.success() = _Success;
  const factory SignUpAdminState.error(NetworkExceptions networkExceptions) =
      _Error;
}
