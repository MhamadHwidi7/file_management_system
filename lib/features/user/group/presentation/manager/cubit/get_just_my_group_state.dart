part of 'get_just_my_group_cubit.dart';

@freezed
class GetJustMyGroupState<T> with _$GetJustMyGroupState<T> {
  const factory GetJustMyGroupState.loading() = _Loading;
  const factory GetJustMyGroupState.success(
      {required List<T> data, required bool canLoadMore}) = _Success;
  const factory GetJustMyGroupState.error(NetworkExceptions networkExceptions) =
      _Error;
}
