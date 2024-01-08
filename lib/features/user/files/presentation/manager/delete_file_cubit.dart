// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/files/domain/params/delete_file_params.dart';
import 'package:file_management_project/features/user/files/domain/use_case/delete_file_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:injectable/injectable.dart';
part 'delete_file_cubit.freezed.dart';
part 'delete_file_state.dart';

@injectable
class DeleteFileCubit extends Cubit<DeleteFileState> {
  final DeleteFileUseCase _deleteFileUseCase;
  DeleteFileCubit(
    this._deleteFileUseCase,
  ) : super(const DeleteFileState.initial());

  Future<void> emitDeleteFile(DeleteFileParams deleteFileParams) async {
    emit(const DeleteFileState.loading());

    final response = await _deleteFileUseCase.call(deleteFileParams);
    response.fold(
        (l) => emit(DeleteFileState.error(l)),

        ///todo:make messages
        (r) => emit(const DeleteFileState.success("Done Delete it")));
  }
}
