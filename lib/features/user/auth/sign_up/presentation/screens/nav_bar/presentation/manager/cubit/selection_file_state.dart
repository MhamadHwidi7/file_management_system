part of 'selection_file_cubit.dart';

@freezed
class SelectionFileState with _$SelectionFileState {
  const factory SelectionFileState.initial() = _Initial;
  const factory SelectionFileState.doneSelected(List<int> selectedIDs) =
      _DoneSelected;
  const factory SelectionFileState.success(String message) = _Success;
}
