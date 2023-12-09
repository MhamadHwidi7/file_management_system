import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/entities/log_in_entity.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/params/log_in_params.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/repository/base_repository.dart';

import '../data_source/remote_data_source/remote_data_source.dart';

import 'package:injectable/injectable.dart';

@Singleton(as: LogInBaseRepository)
class LogInRepositoryImpl implements LogInBaseRepository {
  final NetworkInfo _networkInfo;
  final LogInBaseRemoteDataSource _logInBaseRemoteDataSource;

  LogInRepositoryImpl(this._networkInfo, this._logInBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, LogInEntity>> logIn(
      LogInParams logInParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _logInBaseRemoteDataSource.logIn(logInParams);
        return Right(response);
      } on Exception catch (exc) {
        return Left(
          NetworkExceptions.getException(exc),
        );
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
