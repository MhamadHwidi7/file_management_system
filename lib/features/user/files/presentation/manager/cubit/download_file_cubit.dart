// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/files/domain/params/download_file_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/use_case/download_file_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
part 'download_file_cubit.freezed.dart';
part 'download_file_state.dart';

@injectable
class DownloadFileCubit extends Cubit<DownloadFileState> {
  final DownloadFileUseCase _downloadFileUseCase;
  DownloadFileCubit(
    this._downloadFileUseCase,
  ) : super(const DownloadFileState.initial());

  Future<void> emitDownloadFile(
      DownloadFileParams downloadFileParams, String savePath) async {
    emit(const DownloadFileState.loading());
    final response =
        await _downloadFileUseCase.call(downloadFileParams, savePath);
    response.fold(
      (l) {
        emit(DownloadFileState.error(l));
      },
      (r) {
        emit(DownloadFileState.success(savePath));
      },
    );
  }
}
