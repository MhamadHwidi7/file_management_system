import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/features/user/group/delete_group/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/group/delete_group/domain/params/delete_group_params.dart';
import 'package:file_management_project/features/user/group/delete_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DeleteGroupBaseRepository)
class DeleteGroupRepositoryImpl implements DeleteGroupBaseRepository {
  final NetworkInfo _networkInfo;
  final DeleteGroupBaseRemoteDataSource _deleteGroupBaseRemoteDataSource;

  DeleteGroupRepositoryImpl(
      this._networkInfo, this._deleteGroupBaseRemoteDataSource);
  @override
  Future<Either<NetworkExceptions, void>> deleteGroup(
      DeleteGroupParams deleteGroupParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _deleteGroupBaseRemoteDataSource
            .deleteGroup(deleteGroupParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
