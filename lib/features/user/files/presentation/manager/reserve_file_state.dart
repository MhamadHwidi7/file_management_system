part of 'reserve_file_cubit.dart';

@freezed
class ReserveFileState with _$ReserveFileState {
  const factory ReserveFileState.initial() = _Initial;
  const factory ReserveFileState.loading() = _Loading;
  const factory ReserveFileState.success(String message) = _Success;
  const factory ReserveFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
