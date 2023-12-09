part of 'system_groups_cubit.dart';

@freezed
class SystemGroupsState<T> with _$SystemGroupsState<T> {
  const factory SystemGroupsState.loading() = _Loading;
  const factory SystemGroupsState.success(List<T> data, int currentPage) =
      _Success;
  const factory SystemGroupsState.error(NetworkExceptions networkExceptions) =
      _Error;
}
