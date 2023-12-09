// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/shared_preferences_utils.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/entities/log_in_entity.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/params/log_in_params.dart';
import 'package:file_management_project/features/user/auth/log_in/domain/use_cases/log_in_use_case.dart';

part 'log_in_cubit.freezed.dart';
part 'log_in_state.dart';

@injectable
class LogInCubit extends Cubit<LogInState> {
  final LogInUseCase _logInUseCase;
  final SharedPreferencesUtils _sharedPreferencesUtils;
  LogInCubit(
    this._logInUseCase,
    this._sharedPreferencesUtils,
  ) : super(const LogInState.initial());

  Future<void> emitLogInUser(LogInParams logInParams) async {
    final response = await _logInUseCase.call(logInParams);

    response.fold((l) => emit(LogInState.error(l)), (r) {
      _sharedPreferencesUtils.setToken(r.logInData.token);
      emit(LogInState.success(r));
      _sharedPreferencesUtils.getToken();
      if (kDebugMode) {
        print("Token Here : ${r.logInData.token}");
      }
    });
  }
}
