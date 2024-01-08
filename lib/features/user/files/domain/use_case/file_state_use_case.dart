import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/entites/file_state_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/file_state_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class FileStateUseCase {
  final FileBaseRepository _fileBaseRepository;

  FileStateUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, FileStateEntity>> call(
      FileStateParams fileStateParams) async {
    return await _fileBaseRepository.getFileState(fileStateParams);
  }
}
