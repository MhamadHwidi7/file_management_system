part of 'read_file_cubit.dart';

@freezed
class ReadFileState with _$ReadFileState {
  const factory ReadFileState.initial() = _Initial;
  const factory ReadFileState.loading() = _Loading;
  const factory ReadFileState.success(ReadFileEntity readFileEntity) = _Success;
  const factory ReadFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
