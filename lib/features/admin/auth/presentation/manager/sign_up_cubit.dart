// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/admin/auth/domain/params/sign_up_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final AdminSignUpUseCase _adminSignUpUseCase;
  SignUpCubit(
    this._adminSignUpUseCase,
  ) : super(const SignUpState.initial());

  Future<void> emitRegisterAdmin(AdminSignUpParams adminSignUpParams) async {
    final response = await _adminSignUpUseCase.call(adminSignUpParams);
    response.when(
      success: (_) {
        emit(const SignUpState.success());
      },
      error: (networkExceptions) => emit(SignUpState.error(networkExceptions)),
    );
  }
}
