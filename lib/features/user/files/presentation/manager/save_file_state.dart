part of 'save_file_cubit.dart';

@freezed
class SaveFileState with _$SaveFileState {
  const factory SaveFileState.initial() = _Initial;
  const factory SaveFileState.loading() = _Loading;
  const factory SaveFileState.success(String message) = _Success;
  const factory SaveFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
