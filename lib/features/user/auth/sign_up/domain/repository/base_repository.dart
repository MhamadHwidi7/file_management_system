import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/params/sign_up_params.dart';

abstract class SignUpBaseRepository {
  Future<Either<NetworkExceptions, SignUpEntity>> signUp(
      SignUpParams signUpParams);
}
