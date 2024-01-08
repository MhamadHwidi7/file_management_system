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
class SignUpAdminCubit extends Cubit<SignUpAdminState> {
  final AdminSignUpUseCase _adminSignUpUseCase;
  SignUpAdminCubit(
    this._adminSignUpUseCase,
  ) : super(const SignUpAdminState.initial());

  Future<void> emitRegisterAdmin(AdminSignUpParams adminSignUpParams) async {
    emit(const SignUpAdminState.loading());
    final response = await _adminSignUpUseCase.call(adminSignUpParams);
    response.when(
      success: (_) {
        emit(const SignUpAdminState.success());
      },
      error: (networkExceptions) =>
          emit(SignUpAdminState.error(networkExceptions)),
    );
  }
}
