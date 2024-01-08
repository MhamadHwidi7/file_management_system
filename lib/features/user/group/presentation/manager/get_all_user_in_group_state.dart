part of 'get_all_user_in_group_cubit.dart';

@freezed
class GetAllUserInGroupState with _$GetAllUserInGroupState {
  const factory GetAllUserInGroupState.initial() = _Initial;
  const factory GetAllUserInGroupState.loading() = _Loading;
  const factory GetAllUserInGroupState.success(
      GetAllUsersInGroupEntity getAllUsersInGroupEntity) = _Success;
  const factory GetAllUserInGroupState.error(
      NetworkExceptions networkExceptions) = _Error;
}
