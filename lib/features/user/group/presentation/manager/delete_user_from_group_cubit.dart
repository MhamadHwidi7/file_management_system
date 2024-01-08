// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_user_from_group_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/use_case/delete_user_from_group_use_case.dart';
import 'package:injectable/injectable.dart';

part 'delete_user_from_group_cubit.freezed.dart';
part 'delete_user_from_group_state.dart';

@injectable
class DeleteUserFromGroupCubit extends Cubit<DeleteUserFromGroupState> {
  final DeleteUserFromGroupUseCase _deleteUserFromGroupUseCase;
  DeleteUserFromGroupCubit(
    this._deleteUserFromGroupUseCase,
  ) : super(const DeleteUserFromGroupState.initial());

  Future<void> emitDeleteUserFromGroup(
      DeleteUserFromGroupParams deleteUserFromGroupParams) async {
    emit(const DeleteUserFromGroupState.loading());
    final response =
        await _deleteUserFromGroupUseCase.call(deleteUserFromGroupParams);
    response.fold(
        (l) => emit(DeleteUserFromGroupState.error(l)),
        (r) =>
            emit(const DeleteUserFromGroupState.success('Done Delete user')));
  }
}
