import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'selection_file_state.dart';
part 'selection_file_cubit.freezed.dart';

@injectable
class SelectionFileCubit extends Cubit<SelectionFileState> {
  SelectionFileCubit() : super(const SelectionFileState.initial());

  List<int> files = [];

  void emitSelectFilesToCheckIn(int fileId) {
    if (!files.contains(fileId)) {
      files.add(fileId);
    }
    emit(SelectionFileState.doneSelected(files.toList()));
  }

  void emitUnselectFilesToCheckIn(int fileId) {
    if (files.contains(fileId)) {
      files.remove(fileId);
    }
    emit(SelectionFileState.doneSelected(files.toList()));
  }

  void clearSelectedFiles() {
    files.clear();
    emit(const SelectionFileState.success('Done'));
  }
}
