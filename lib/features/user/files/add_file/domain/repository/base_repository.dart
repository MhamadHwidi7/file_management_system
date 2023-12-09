import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/add_file/domain/entities/add_files_entity.dart';
import 'package:file_management_project/features/user/files/add_file/domain/params/add_file_params.dart';

abstract class AddFileBaseRepsitory {
  Future<Either<NetworkExceptions, AddFilesEntity>> addFile(
      AddFilesParams addFilesParams);
}
