// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/params/add_file_to_group_params.dart';
import 'package:file_management_project/features/user/group/domain/use_case/add_file_to_group_use_case.dart';

part 'add_file_to_group_cubit.freezed.dart';
part 'add_file_to_group_state.dart';

@injectable
class AddFileToGroupCubit extends Cubit<AddFileToGroupState> {
  final AddFileToGroupUseCase _addFileToGroupUseCase;
  AddFileToGroupCubit(
    this._addFileToGroupUseCase,
  ) : super(const AddFileToGroupState.initial());

  Future<void> emitAddFileToGroup(
      AddFileToGroupParams addFileToGroupParams) async {
    emit(const AddFileToGroupState.loading());
    final response = await _addFileToGroupUseCase.call(addFileToGroupParams);
    response.fold((l) => emit(AddFileToGroupState.error(l)),
        (r) => emit(const AddFileToGroupState.success('Done Added')));
  }
}
