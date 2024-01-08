part of 'create_group_cubit.dart';

@freezed
class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState.initial() = _Initial;
  const factory CreateGroupState.loading() = _Loading;
  const factory CreateGroupState.success(String message) = _Success;
  const factory CreateGroupState.error(NetworkExceptions networkExceptions) =
      _Error;
}
