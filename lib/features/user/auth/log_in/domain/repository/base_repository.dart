import 'package:dartz/dartz.dart';
import '../../../../../core/error/network_exceptions.dart';
import '../entities/log_in_entity.dart';
import '../params/log_in_params.dart';

abstract class LogInBaseRepository {
  Future<Either<NetworkExceptions, LogInEntity>> logIn(LogInParams logInParams);
}
