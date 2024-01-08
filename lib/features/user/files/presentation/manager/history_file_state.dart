part of 'history_file_cubit.dart';

@freezed
class HistoryFileState<T> with _$HistoryFileState<T> {
  const factory HistoryFileState.loading() = _Loading;
  const factory HistoryFileState.success(
      {required List<T> data, required bool canLoadMore}) = _Success;
  const factory HistoryFileState.error(NetworkExceptions networkExceptions) =
      _Error;
}
