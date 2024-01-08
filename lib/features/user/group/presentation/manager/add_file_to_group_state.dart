part of 'add_file_to_group_cubit.dart';

@freezed
class AddFileToGroupState with _$AddFileToGroupState {
  const factory AddFileToGroupState.initial() = _Initial;
  const factory AddFileToGroupState.loading() = _Loading;
  const factory AddFileToGroupState.success(String message) = _Success;
  const factory AddFileToGroupState.error(NetworkExceptions networkExceptions) =
      _Error;
}
