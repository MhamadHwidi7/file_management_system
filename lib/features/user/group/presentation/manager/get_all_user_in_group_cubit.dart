// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_all_user_in_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_user_in_group_params.dart';
import 'package:file_management_project/features/user/group/domain/use_case/get_all_user_in_group_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:injectable/injectable.dart';
part 'get_all_user_in_group_cubit.freezed.dart';
part 'get_all_user_in_group_state.dart';

@injectable
class GetAllUserInGroupCubit extends Cubit<GetAllUserInGroupState> {
  final GetAllUserInGroupUseCase _getAllUserInGroupUseCase;
  GetAllUserInGroupCubit(
    this._getAllUserInGroupUseCase,
  ) : super(const GetAllUserInGroupState.initial());

  Future<void> emitGetAllUserInGroup(
      GetAllUserInGroupParams getAllUserInGroupParams) async {
    emit(const GetAllUserInGroupState.loading());
    final response =
        await _getAllUserInGroupUseCase.call(getAllUserInGroupParams);
    response.fold((l) => emit(GetAllUserInGroupState.error(l)),
        (r) => emit(GetAllUserInGroupState.success(r)));
  }
}
