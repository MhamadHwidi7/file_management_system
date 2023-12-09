import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/create_group/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/group/create_group/domain/params/create_group_params.dart';
import 'package:file_management_project/features/user/group/create_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CreateGroupBaseRepository)
class CreateGroupRepositoryImpl implements CreateGroupBaseRepository {
  final NetworkInfo _networkInfo;
  final CreateGroupBaseRemoteDataSource _createGroupBaseRemoteDataSource;

  CreateGroupRepositoryImpl(
      this._networkInfo, this._createGroupBaseRemoteDataSource);
  @override
  Future<ApiResult<void>> createGroup(
      CreateGroupParams createGroupParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _createGroupBaseRemoteDataSource
            .createGroup(createGroupParams);
        return ApiResult.success(response);
      } on Exception catch (ex) {
        return ApiResult.error(NetworkExceptions.getException(ex));
      }
    } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }
  }
}
