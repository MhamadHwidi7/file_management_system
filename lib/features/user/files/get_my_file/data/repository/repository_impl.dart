import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/features/user/files/get_my_file/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/entities/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/params/get_my_files_params.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: GetMyFilesBaseRepository)
class GetMyFilesRepositoryImpl implements GetMyFilesBaseRepository {
  final NetworkInfo _networkInfo;
  final GetMyFilesBaseRemoteDataSource _getMyFilesBaseRemoteDataSource;

  GetMyFilesRepositoryImpl(
      this._networkInfo, this._getMyFilesBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, GetMyFilesEntity>> getMyFiles(
      GetMyFilesParams getMyFilesParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _getMyFilesBaseRemoteDataSource.getMyFiles(getMyFilesParams);
        return Right(response);
      } on Exception catch (exc) {
        return Left(NetworkExceptions.getException(exc));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
