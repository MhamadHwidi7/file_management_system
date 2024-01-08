import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/entites/read_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/read_file_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@singleton
class ReadFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  ReadFileUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, ReadFileEntity>> call(
      ReadFileParams readFileParams) async {
    return await _fileBaseRepository.readFile(readFileParams);
  }
}
