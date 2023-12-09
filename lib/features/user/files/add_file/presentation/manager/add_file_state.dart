part of 'add_file_cubit.dart';

@freezed
class AddFileState with _$AddFileState {
  const factory AddFileState.initial() = _Initial;
  const factory AddFileState.loading() = _Loading;
  const factory AddFileState.success(AddFilesEntity addFilesEntity) = _Success;
  const factory AddFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
