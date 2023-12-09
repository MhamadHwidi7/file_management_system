import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/delete_file/domain/params/delete_file_params.dart';

abstract class DeleteFileBaseRepository {
  Future<Either<NetworkExceptions, void>> deleteFile(
      DeleteFileParams deleteFileParams);
}
