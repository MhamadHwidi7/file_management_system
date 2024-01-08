part of 'delete_file_from_group_cubit.dart';

@freezed
class DeleteFileFromGroupState with _$DeleteFileFromGroupState {
  const factory DeleteFileFromGroupState.initial() = _Initial;
  const factory DeleteFileFromGroupState.loading() = _Loading;
  const factory DeleteFileFromGroupState.success(String message) = _Success;
  const factory DeleteFileFromGroupState.error(
      NetworkExceptions networkExceptions) = _Error;
}
