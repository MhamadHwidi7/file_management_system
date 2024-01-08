// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_group_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/use_case/delete_group_use_case.dart';
import 'package:injectable/injectable.dart';

part 'delete_group_cubit.freezed.dart';
part 'delete_group_state.dart';

@injectable
class DeleteGroupCubit extends Cubit<DeleteGroupState> {
  final DeleteGroupUseCase _deleteGroupUseCase;
  DeleteGroupCubit(
    this._deleteGroupUseCase,
  ) : super(const DeleteGroupState.initial());

  Future<void> emitDeleteGroup(DeleteGroupParams deleteGroupParams) async {
    emit(const DeleteGroupState.loading());
    final response = await _deleteGroupUseCase.call(deleteGroupParams);
    response.fold((l) => emit(DeleteGroupState.error(l)),
        (r) => emit(const DeleteGroupState.success('Done Delete it')));
  }
}
