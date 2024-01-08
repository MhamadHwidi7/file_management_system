part of 'get_my_group_cubit.dart';

@freezed
class GetMyGroupState<T> with _$GetMyGroupState<T> {
  const factory GetMyGroupState.loading() = _Loading;
  const factory GetMyGroupState.success(
      {required List<T> data, required bool canLoadMore}) = _Success;
  const factory GetMyGroupState.error(NetworkExceptions networkExceptions) =
      _Error;
}
