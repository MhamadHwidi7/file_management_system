import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/features/user/auth/sign_up/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/params/sign_up_params.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@Singleton(as: SignUpBaseRepository)
class SignUpRepositoryImpl implements SignUpBaseRepository {
  //final NetworkInfo _networkInfo;
  final SignUpBaseRemoteDataSource _signUpBaseRemoteDataSource;

  SignUpRepositoryImpl(
      //this._networkInfo,
      this._signUpBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, SignUpEntity>> signUp(
      SignUpParams signUpParams) async {
    //  if (await _networkInfo.isConnected) {
    try {
      final response = await _signUpBaseRemoteDataSource.signUp(signUpParams);
      return Right(response);
    } on Exception catch (exc) {
      return Left(
        NetworkExceptions.getException(exc),
      );
    }
    /*} else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }
}
