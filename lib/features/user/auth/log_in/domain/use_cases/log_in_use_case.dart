import 'package:dartz/dartz.dart';
import '../../../../../core/error/network_exceptions.dart';
import '../entities/log_in_entity.dart';
import '../params/log_in_params.dart';
import '../repository/base_repository.dart';

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
