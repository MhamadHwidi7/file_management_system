part of 'log_in_cubit.dart';

@freezed
class LogInAdminState with _$LogInAdminState {
  const factory LogInAdminState.initial() = _Initial;
  const factory LogInAdminState.loading() = _Loading;
  const factory LogInAdminState.success(AdminLogInEntity adminLogInEntity) =
      _Success;
  const factory LogInAdminState.error(NetworkExceptions networkExceptions) =
      _Error;
}
