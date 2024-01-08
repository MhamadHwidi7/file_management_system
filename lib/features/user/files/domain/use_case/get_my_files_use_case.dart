import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/entites/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetMyFilesUseCase {
  final FileBaseRepository _fileBaseRepository;

  GetMyFilesUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, GetMyFilesEntity>> call() async {
    return await _fileBaseRepository.getMyFiles();
  }
}
