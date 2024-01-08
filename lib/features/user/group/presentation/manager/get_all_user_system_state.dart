part of 'get_all_user_system_cubit.dart';

@freezed
class GetAllUserSystemState<T> with _$GetAllUserSystemState<T> {
  const factory GetAllUserSystemState.loading() = _Loading;
  const factory GetAllUserSystemState.success(
      {required List<T> data, required bool canLoadMore}) = _Success;
  const factory GetAllUserSystemState.error(
      NetworkExceptions networkExceptions) = _Error;
}
