import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/entities/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/params/get_my_files_params.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@singleton
class GetMyFilesUseCase {
  final GetMyFilesBaseRepository _getMyFilesBaseRepository;

  GetMyFilesUseCase(this._getMyFilesBaseRepository);

  Future<Either<NetworkExceptions, GetMyFilesEntity>> call(
      GetMyFilesParams getMyFilesParams) async {
    return await _getMyFilesBaseRepository.getMyFiles(getMyFilesParams);
  }
}
