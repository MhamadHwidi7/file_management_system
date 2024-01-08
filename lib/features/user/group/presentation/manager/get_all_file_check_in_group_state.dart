part of 'get_all_file_check_in_group_cubit.dart';

@freezed
class GetAllFileCheckInGroupState with _$GetAllFileCheckInGroupState {
  const factory GetAllFileCheckInGroupState.initial() = _Initial;
  const factory GetAllFileCheckInGroupState.loading() = _Loading;
  const factory GetAllFileCheckInGroupState.success(
      GetAllFileCheckInGroupEntity getAllFileCheckInGroupEntity) = _Success;
  const factory GetAllFileCheckInGroupState.error(
      NetworkExceptions networkExceptions) = _Error;
}
