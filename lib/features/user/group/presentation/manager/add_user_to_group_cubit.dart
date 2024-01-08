// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/params/add_user_to_group_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/features/user/group/domain/use_case/add_user_to_group_use_case.dart';

part 'add_user_to_group_cubit.freezed.dart';
part 'add_user_to_group_state.dart';

@injectable
class AddUserToGroupCubit extends Cubit<AddUserToGroupState> {
  final AddUserToGroupUseCase _addUserToGroupUseCase;
  AddUserToGroupCubit(
    this._addUserToGroupUseCase,
  ) : super(const AddUserToGroupState.initial());

  Future<void> emitAddUserToGroup(
      AddUserToGroupParams addUserToGroupParams) async {
    emit(const AddUserToGroupState.loading());
    final response = await _addUserToGroupUseCase.call(addUserToGroupParams);
    response.fold((l) => emit(AddUserToGroupState.error(l)),
        (r) => emit(const AddUserToGroupState.success('Done Added')));
  }
}
