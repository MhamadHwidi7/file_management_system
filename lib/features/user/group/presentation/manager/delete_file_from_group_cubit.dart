// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_file_from_group_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/use_case/delete_file_from_group_use_case.dart';

part 'delete_file_from_group_cubit.freezed.dart';
part 'delete_file_from_group_state.dart';

@injectable
class DeleteFileFromGroupCubit extends Cubit<DeleteFileFromGroupState> {
  final DeleteFileFromGroupUseCase _deleteFileFromGroupUseCase;
  DeleteFileFromGroupCubit(
    this._deleteFileFromGroupUseCase,
  ) : super(const DeleteFileFromGroupState.initial());

  Future<void> emitDeleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams) async {
    emit(const DeleteFileFromGroupState.loading());
    final response =
        await _deleteFileFromGroupUseCase.call(deleteFileFromGroupParams);
    response.when(
      success: (data) {
        emit(const DeleteFileFromGroupState.success('Done Delete it'));
      },
      error: (networkExceptions) {
        emit(DeleteFileFromGroupState.error(networkExceptions));
      },
    );
  }
}
