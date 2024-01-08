// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/params/sign_up_params.dart';
import 'package:file_management_project/features/user/auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  SignUpCubit(
    this._signUpUseCase,
  ) : super(const SignUpState.initial());

  Future<void> emitSignUpUser(SignUpParams signUpParams) async {
    emit(const SignUpState.loading());
    final response = await _signUpUseCase.call(signUpParams);

    response.fold((l) => emit(SignUpState.error(l)), (r) {
      emit(SignUpState.success(r));
    });
  }
}
