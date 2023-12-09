import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/entities/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/params/get_my_files_params.dart';

abstract class GetMyFilesBaseRepository {
  Future<Either<NetworkExceptions, GetMyFilesEntity>> getMyFiles(
      GetMyFilesParams getMyFilesParams);
}
