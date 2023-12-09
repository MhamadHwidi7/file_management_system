part of 'log_in_cubit.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState.initial() = _Initial;
  const factory LogInState.loading() = _Loading;
  const factory LogInState.success(AdminLogInEntity adminLogInEntity) =
      _Success;
  const factory LogInState.error(NetworkExceptions networkExceptions) = _Error;
}
