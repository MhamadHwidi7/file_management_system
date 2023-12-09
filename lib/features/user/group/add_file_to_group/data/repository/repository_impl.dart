import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/features/user/group/add_file_to_group/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/group/add_file_to_group/domain/params/add_file_to_group_params.dart';
import 'package:file_management_project/features/user/group/add_file_to_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AddFileToGroupBaseRepository)
class AddFileToGroupRepositoryImpl implements AddFileToGroupBaseRepository {
  final NetworkInfo _networkInfo;
  final AddFileToGroupBaseRemoteDataSource _addFileToGroupBaseRemoteDataSource;

  AddFileToGroupRepositoryImpl(
      this._networkInfo, this._addFileToGroupBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, void>> addFileToGroup(
      AddFileToGroupParams addFileToGroupParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _addFileToGroupBaseRemoteDataSource
            .addFileToGroup(addFileToGroupParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
