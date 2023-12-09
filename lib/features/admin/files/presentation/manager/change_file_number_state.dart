part of 'change_file_number_cubit.dart';

@freezed
class ChangeFileNumberState with _$ChangeFileNumberState {
  const factory ChangeFileNumberState.initial() = _Initial;
  const factory ChangeFileNumberState.loading() = _Loading;
  const factory ChangeFileNumberState.success(String message) = _Success;
  const factory ChangeFileNumberState.error(
      NetworkExceptions networkExceptions) = _Error;
}
