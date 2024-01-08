import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/entities/log_in_entity.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/params/log_in_params.dart';


abstract class LogInBaseRepository {
  Future<Either<NetworkExceptions, LogInEntity>> logIn(LogInParams logInParams);
}
