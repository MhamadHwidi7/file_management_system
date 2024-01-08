import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/params/sign_up_params.dart';
import 'package:injectable/injectable.dart';

abstract class SignUpBaseRemoteDataSource {
  Future<SignUpEntity> signUp(SignUpParams signUpParams);
}

@Singleton(as: SignUpBaseRemoteDataSource)
class SignUpRemoteDataSourceImpl implements SignUpBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  SignUpRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<SignUpEntity> signUp(SignUpParams signUpParams) async {
    final respone =
        await _apiConsumer.post(EndPoints.signUp, body: signUpParams.toJson());

    return SignUpEntity.fromJson(respone);
  }
}
