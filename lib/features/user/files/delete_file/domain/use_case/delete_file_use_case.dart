import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/delete_file/domain/params/delete_file_params.dart';
import 'package:file_management_project/features/user/files/delete_file/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteFileUseCase {
  final DeleteFileBaseRepository _deleteFileBaseRepository;

  DeleteFileUseCase(this._deleteFileBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      DeleteFileParams deleteFileParams) async {
    return await _deleteFileBaseRepository.deleteFile(deleteFileParams);
  }
}
