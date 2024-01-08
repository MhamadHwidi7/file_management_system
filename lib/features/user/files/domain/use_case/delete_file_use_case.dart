import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/params/delete_file_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  DeleteFileUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      DeleteFileParams deleteFileParams) async {
    return await _fileBaseRepository.deleteFile(deleteFileParams);
  }
}
