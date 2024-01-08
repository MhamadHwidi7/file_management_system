// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/files/domain/params/save_file_params.dart';
import 'package:file_management_project/features/user/files/domain/use_case/save_file_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
part 'save_file_cubit.freezed.dart';
part 'save_file_state.dart';

@injectable
class SaveFileCubit extends Cubit<SaveFileState> {
  final SaveFileUseCase _saveFileUseCase;
  SaveFileCubit(
    this._saveFileUseCase,
  ) : super(const SaveFileState.initial());

  ///todo:test it
  Future<void> emitSaveFile(SaveFileParams saveFileParams) async {
    emit(const SaveFileState.loading());
    final response = await _saveFileUseCase.call(saveFileParams);
    response.fold((l) => emit(SaveFileState.error(l)),
        (r) => emit(const SaveFileState.success("Done Saved File")));
  }
}
