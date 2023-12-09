part of 'get_my_files_cubit.dart';

@freezed
class GetMyFilesState<T> with _$GetMyFilesState<T> {
  const factory GetMyFilesState.initial() = _Initial<T>;
  const factory GetMyFilesState.loading() = _Loading<T>;
  const factory GetMyFilesState.success(GetMyFilesEntity getMyFilesEntity) =
      _Success<T>;
  const factory GetMyFilesState.error(NetworkExceptions networkExceptions) =
      _Error<T>;
}
