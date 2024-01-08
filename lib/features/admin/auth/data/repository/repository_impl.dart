import '../../../../../core/error/network_exceptions.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/utils/api_result.dart';
import '../data_source/remote_data_source/remote_data_source.dart';
import '../../domain/entities/log_in_entity.dart';
import '../../domain/params/log_in_params.dart';
import '../../domain/params/sign_up_params.dart';
import '../../domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AdminAuthBaseRepository)
class AdminAuthRepositoryImpl implements AdminAuthBaseRepository {
  // final NetworkInfo _networkInfo;
  final AdminAuthBaseRemoteDataSource _adminAuthBaseRemoteDataSource;

  AdminAuthRepositoryImpl(
      // this._networkInfo,
      this._adminAuthBaseRemoteDataSource);
  @override
  Future<ApiResult<AdminLogInEntity>> adminLogIn(
      AdminLogInParams adminLogInParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response =
          await _adminAuthBaseRemoteDataSource.adminLogIn(adminLogInParams);
      return ApiResult.success(response);
    } on Exception catch (exc) {
      return ApiResult.error(NetworkExceptions.getException(exc));
    }
    // } else {
    //  return const ApiResult.error(NetworkExceptions.noInternetConnection());
    //}
  }

  @override
  Future<ApiResult<void>> adminSignUp(
      AdminSignUpParams adminSignUpParams) async {
    //if (await _networkInfo.isConnected) {
    try {
      final response =
          await _adminAuthBaseRemoteDataSource.adminSignUp(adminSignUpParams);
      return ApiResult.success(response);
    } on Exception catch (exc) {
      return ApiResult.error(NetworkExceptions.getException(exc));
    }
    // } else {
    // return const ApiResult.error(NetworkExceptions.noInternetConnection());
    //}
  }
}
