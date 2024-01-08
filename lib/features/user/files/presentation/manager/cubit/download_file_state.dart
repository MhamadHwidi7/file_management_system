part of 'download_file_cubit.dart';

@freezed
class DownloadFileState<T> with _$DownloadFileState<T> {
  const factory DownloadFileState.initial() = _Initial;
  const factory DownloadFileState.loading() = _Loading;
  const factory DownloadFileState.success(String savePath) = _Success;
  const factory DownloadFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
