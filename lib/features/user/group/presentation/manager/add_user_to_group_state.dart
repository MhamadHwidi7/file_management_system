part of 'add_user_to_group_cubit.dart';

@freezed
class AddUserToGroupState with _$AddUserToGroupState {
  const factory AddUserToGroupState.initial() = _Initial;
  const factory AddUserToGroupState.loading() = _Loading;
  const factory AddUserToGroupState.success(String message) = _Success;
  const factory AddUserToGroupState.error(NetworkExceptions networkExceptions) =
      _Error;
}
