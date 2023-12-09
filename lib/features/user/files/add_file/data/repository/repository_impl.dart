import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/features/user/files/add_file/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/files/add_file/domain/entities/add_files_entity.dart';
import 'package:file_management_project/features/user/files/add_file/domain/params/add_file_params.dart';
import 'package:file_management_project/features/user/files/add_file/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AddFileBaseRepsitory)
class AddFileRepositoryImpl implements AddFileBaseRepsitory {
  final NetworkInfo _networkInfo;
  final AddFileBaseRemoteDataSource _addFileBaseRemoteDataSource;

  AddFileRepositoryImpl(this._networkInfo, this._addFileBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, AddFilesEntity>> addFile(
      AddFilesParams addFilesParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final respone =
            await _addFileBaseRemoteDataSource.addFile(addFilesParams);
        return Right(respone);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
