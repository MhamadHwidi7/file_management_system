
import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/entities/log_in_entity.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/params/log_in_params.dart';
import 'package:injectable/injectable.dart';

abstract class LogInBaseRemoteDataSource {
  Future<LogInEntity> logIn(LogInParams logInParams);
}

@Singleton(as: LogInBaseRemoteDataSource)
class LogInRemoteDataSourceImpl implements LogInBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  LogInRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<LogInEntity> logIn(LogInParams logInParams) async {
    final respone =
        await _apiConsumer.post(EndPoints.logIn, body: logInParams.toJson());

    return LogInEntity.fromJson(respone);
  }
}
