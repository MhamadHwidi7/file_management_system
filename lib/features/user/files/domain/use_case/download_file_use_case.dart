import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/params/download_file_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DownloadFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  DownloadFileUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      DownloadFileParams downloadFileParams, String savePath) async {
    return await _fileBaseRepository.downloadFile(downloadFileParams, savePath);
  }
}
