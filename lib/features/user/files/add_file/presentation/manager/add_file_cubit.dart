// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/files/add_file/domain/params/add_file_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/add_file/domain/entities/add_files_entity.dart';
import 'package:file_management_project/features/user/files/add_file/domain/use_case/add_file_use_case.dart';

part 'add_file_cubit.freezed.dart';
part 'add_file_state.dart';

@injectable
class AddFileCubit extends Cubit<AddFileState> {
  final AddFileUseCase _addFileUseCase;
  AddFileCubit(
    this._addFileUseCase,
  ) : super(const AddFileState.initial());

  Future<void> emitAddFile(AddFilesParams addFilesParams) async {
    emit(const AddFileState.loading());
    final response = await _addFileUseCase.call(addFilesParams);
    response.fold((l) => emit(AddFileState.error(l)),
        (r) => emit(AddFileState.success(r)));
  }
}
