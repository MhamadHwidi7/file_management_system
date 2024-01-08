part of 'get_state_file_cubit.dart';

@freezed
class GetStateFileState with _$GetStateFileState {
  const factory GetStateFileState.loading() = _Loading;
  const factory GetStateFileState.success(FileStateEntity fileStateEntity) =
      _Success;
  const factory GetStateFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
