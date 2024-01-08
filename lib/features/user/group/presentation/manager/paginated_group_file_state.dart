part of 'paginated_group_file_cubit.dart';

@freezed
class PaginatedGroupFileState<T> with _$PaginatedGroupFileState<T> {
  const factory PaginatedGroupFileState.loading() = _Loading;
  const factory PaginatedGroupFileState.success(
      {required List<T> data, required bool canLoadMore}) = _Success;
  const factory PaginatedGroupFileState.error(
      NetworkExceptions networkExceptions) = _Error;
}
