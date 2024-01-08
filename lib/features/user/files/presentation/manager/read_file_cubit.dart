// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/files/domain/entites/read_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/read_file_params.dart';
import 'package:file_management_project/features/user/files/domain/use_case/read_file_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
part 'read_file_cubit.freezed.dart';
part 'read_file_state.dart';

@injectable
class ReadFileCubit extends Cubit<ReadFileState> {
  final ReadFileUseCase _readFileUseCase;
  ReadFileCubit(
    this._readFileUseCase,
  ) : super(const ReadFileState.initial());

  Future<void> emitReadFile(ReadFileParams readFileParams) async {
    emit(const ReadFileState.loading());
    final response = await _readFileUseCase.call(readFileParams);
    response.fold((l) => emit(ReadFileState.error(l)),
        (r) => emit(ReadFileState.success(r)));
  }
}
