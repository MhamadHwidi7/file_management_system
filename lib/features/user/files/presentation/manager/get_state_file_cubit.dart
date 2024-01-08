// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/files/domain/params/file_state_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/entites/file_state_entity.dart';
import 'package:file_management_project/features/user/files/domain/use_case/file_state_use_case.dart';
import 'package:injectable/injectable.dart';

part 'get_state_file_cubit.freezed.dart';
part 'get_state_file_state.dart';

@injectable
class GetStateFileCubit extends Cubit<GetStateFileState> {
  final FileStateUseCase _fileStateUseCase;
  GetStateFileCubit(
    this._fileStateUseCase,
  ) : super(const GetStateFileState.loading());

  Future<void> emitGetFileState(FileStateParams fileStateParams) async {
    emit(const GetStateFileState.loading());
    final response = await _fileStateUseCase.call(fileStateParams);
    response.fold((l) => emit(GetStateFileState.error(l)),
        (r) => emit(GetStateFileState.success(r)));
  }
}
