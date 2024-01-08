part of 'delete_user_from_group_cubit.dart';

@freezed
class DeleteUserFromGroupState with _$DeleteUserFromGroupState {
  const factory DeleteUserFromGroupState.initial() = _Initial;
  const factory DeleteUserFromGroupState.loading() = _Loading;
  const factory DeleteUserFromGroupState.success(String message) = _Success;
  const factory DeleteUserFromGroupState.error(
      NetworkExceptions networkExceptions) = _Error;
}
