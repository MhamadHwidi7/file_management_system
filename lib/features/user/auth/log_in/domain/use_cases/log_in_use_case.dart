import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/entities/log_in_entity.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/params/log_in_params.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/repository/base_repository.dart';


import 'package:injectable/injectable.dart';

@singleton
class LogInUseCase {
  final LogInBaseRepository _logInBaseRepository;

  LogInUseCase(this._logInBaseRepository);

  Future<Either<NetworkExceptions, LogInEntity>> call(
      LogInParams signUpParams) async {
    return await _logInBaseRepository.logIn(signUpParams);
  }
}
