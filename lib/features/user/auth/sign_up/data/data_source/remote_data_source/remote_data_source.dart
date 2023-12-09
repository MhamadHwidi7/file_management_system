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
