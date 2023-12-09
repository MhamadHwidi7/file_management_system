import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/delete_file_from_group/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/group/delete_file_from_group/domain/params/delete_file_from_group_params.dart';
import 'package:file_management_project/features/user/group/delete_file_from_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DeleteFileFromGroupBaseRepository)
class DeleteFileFromGroupRepositoryImpl
    implements DeleteFileFromGroupBaseRepository {
  final NetworkInfo _networkInfo;
  final DeleteFileFromGroupBaseRemoteDataSource
      _deleteFileFromGroupBaseRemoteDataSource;

  DeleteFileFromGroupRepositoryImpl(
      this._networkInfo, this._deleteFileFromGroupBaseRemoteDataSource);

  @override
  Future<ApiResult<void>> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _deleteFileFromGroupBaseRemoteDataSource
            .deleteFileFromGroup(deleteFileFromGroupParams);
        return ApiResult.success(response);
      } on Exception catch (exc) {
        return ApiResult.error(NetworkExceptions.getException(exc));
      }
    } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }
  }
}
