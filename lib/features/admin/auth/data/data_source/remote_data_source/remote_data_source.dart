import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/end_points.dart';
import '../../../domain/entities/log_in_entity.dart';
import '../../../domain/params/log_in_params.dart';
import '../../../domain/params/sign_up_params.dart';
import 'package:injectable/injectable.dart';

abstract class AdminAuthBaseRemoteDataSource {
  Future<void> adminSignUp(AdminSignUpParams adminSignUpParams);
  Future<AdminLogInEntity> adminLogIn(AdminLogInParams adminLogInParams);
}

@Singleton(as: AdminAuthBaseRemoteDataSource)
class AdminAuthRemoteDataSourceImpl implements AdminAuthBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AdminAuthRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<AdminLogInEntity> adminLogIn(AdminLogInParams adminLogInParams) async {
    final response = await _apiConsumer.post(EndPoints.adminLogIn,
        body: adminLogInParams.toJson());
    return AdminLogInEntity.fromJson(response);
  }

  @override
  Future<void> adminSignUp(AdminSignUpParams adminSignUpParams) async {
    return await _apiConsumer.post(EndPoints.adminSignUp,
        body: adminSignUpParams.toJson());
  }
}
