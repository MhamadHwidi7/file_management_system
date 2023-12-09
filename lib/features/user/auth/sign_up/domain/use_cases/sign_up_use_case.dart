import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/params/sign_up_params.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@singleton
class SignUpUseCase {
  final SignUpBaseRepository _signUpBaseRepository;

  SignUpUseCase(this._signUpBaseRepository);

  Future<Either<NetworkExceptions, SignUpEntity>> call(
      SignUpParams signUpParams) async {
    return await _signUpBaseRepository.signUp(signUpParams);
  }
}
