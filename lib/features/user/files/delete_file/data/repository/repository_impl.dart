import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/features/user/files/delete_file/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/files/delete_file/domain/params/delete_file_params.dart';
import 'package:file_management_project/features/user/files/delete_file/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@Singleton(as: DeleteFileBaseRepository)
class DeleteFileRepositoryImpl implements DeleteFileBaseRepository {
  final NetworkInfo _networkInfo;
  final DeleteFileBaseRemoteDataSource _deleteFileBaseRemoteDataSource;

  DeleteFileRepositoryImpl(
      this._networkInfo, this._deleteFileBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, void>> deleteFile(
      DeleteFileParams deleteFileParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _deleteFileBaseRemoteDataSource.deleteFile(deleteFileParams);
        return Right(response);
      } on Exception catch (exc) {
        return Left(NetworkExceptions.getException(exc));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
