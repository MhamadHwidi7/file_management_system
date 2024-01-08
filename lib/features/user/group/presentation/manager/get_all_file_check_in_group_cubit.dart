// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_all_file_check_in_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_file_check_in_group_params.dart';
import 'package:file_management_project/features/user/group/domain/use_case/get_all_file_check_in_group_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:injectable/injectable.dart';

part 'get_all_file_check_in_group_cubit.freezed.dart';
part 'get_all_file_check_in_group_state.dart';

@injectable
class GetAllFileCheckInGroupCubit extends Cubit<GetAllFileCheckInGroupState> {
  final GetAllFilesCheckInGroupUseCase _getAllFilesCheckInGroupUseCase;
  GetAllFileCheckInGroupCubit(
    this._getAllFilesCheckInGroupUseCase,
  ) : super(const GetAllFileCheckInGroupState.loading());

  Future<void> emitGetAllFileCheckIn(
      GetAllFileCheckInGroupParams getAllFileCheckInGroupParams) async {
    emit(const GetAllFileCheckInGroupState.loading());
    final response = await _getAllFilesCheckInGroupUseCase
        .call(getAllFileCheckInGroupParams);
    response.fold((l) {
      emit(GetAllFileCheckInGroupState.error(l));
    }, (r) {
      emit(GetAllFileCheckInGroupState.success(r)); // Fix: use emit here
    });
  }
}
