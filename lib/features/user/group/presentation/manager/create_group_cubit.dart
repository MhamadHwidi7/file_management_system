// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/params/create_group_params.dart';
import 'package:file_management_project/features/user/group/domain/use_case/create_group_use_case.dart';
import 'package:file_management_project/features/user/group/presentation/manager/cubit/get_my_group_cubit.dart';

part 'create_group_cubit.freezed.dart';
part 'create_group_state.dart';

@injectable
class CreateGroupCubit extends Cubit<CreateGroupState> {
  final CreateGroupUseCase _createGroupUseCase;

  CreateGroupCubit(
    this._createGroupUseCase,
  ) : super(const CreateGroupState.initial());

  Future<void> emitCreateGroup(CreateGroupParams createGroupParams) async {
    emit(const CreateGroupState.loading());
    final response = await _createGroupUseCase.call(createGroupParams);
    response.when(
      success: (data) {
        emit(const CreateGroupState.success('Done Added'));
      },
      error: (networkExceptions) {
        emit(CreateGroupState.error(networkExceptions));
      },
    );
  }
}
