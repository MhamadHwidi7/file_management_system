part of 'delete_file_cubit.dart';

@freezed
class DeleteFileState with _$DeleteFileState {
  const factory DeleteFileState.initial() = _Initial;
  const factory DeleteFileState.loading() = _Loading;
  const factory DeleteFileState.success(String message) = _Success;
  const factory DeleteFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
