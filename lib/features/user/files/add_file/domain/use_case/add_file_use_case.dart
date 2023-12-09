import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/add_file/domain/entities/add_files_entity.dart';
import 'package:file_management_project/features/user/files/add_file/domain/params/add_file_params.dart';
import 'package:file_management_project/features/user/files/add_file/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@singleton
class AddFileUseCase {
  final AddFileBaseRepsitory _addFileBaseRepsitory;

  AddFileUseCase(this._addFileBaseRepsitory);

  Future<Either<NetworkExceptions, AddFilesEntity>> call(
      AddFilesParams addFilesParams) async {
    return await _addFileBaseRepsitory.addFile(addFilesParams);
  }
}
