import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/entites/add_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/add_file_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@singleton
class AddFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  AddFileUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, AddFilesEntity>> call(
      AddFilesParams addFilesParams) async {
    return await _fileBaseRepository.addFile(addFilesParams);
  }
}
