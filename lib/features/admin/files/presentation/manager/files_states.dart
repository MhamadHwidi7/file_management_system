part of 'files_cubit.dart';

@freezed
class FileState<T> with _$FileState<T> {
  const factory FileState.loading() = _Loading;
  const factory FileState.success(
      {required List<T> data, required bool canLoadMore}) = _Success;
  const factory FileState.error(NetworkExceptions networkExceptions) = _Error;
}
