// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/shared_preferences_utils.dart';
import 'package:file_management_project/features/admin/auth/domain/entities/log_in_entity.dart';
import 'package:file_management_project/features/admin/auth/domain/params/log_in_params.dart';
import 'package:file_management_project/features/admin/auth/domain/use_cases/log_in_use_case.dart';
import 'package:injectable/injectable.dart';

part 'log_in_cubit.freezed.dart';
part 'log_in_state.dart';

@injectable
class LogInCubit extends Cubit<LogInState> {
  final AdminLogInUseCase _adminLogInUseCase;
  final SharedPreferencesUtils _sharedPreferencesUtils;
  LogInCubit(
    this._adminLogInUseCase,
    this._sharedPreferencesUtils,
  ) : super(const LogInState.initial());

  Future<void> emitLogInAdmin(AdminLogInParams adminLogInParams) async {
    final response = await _adminLogInUseCase.call(adminLogInParams);
    response.when(
      success: (data) {
        _sharedPreferencesUtils.setToken(data.adminLogInData.token);
        emit(LogInState.success(data));
        _sharedPreferencesUtils.getToken();
        if (kDebugMode) {
          print("Token Here : ${data.adminLogInData.token}");
        }
      },
      error: (networkExceptions) => emit(LogInState.error(networkExceptions)),
    );
  }
}
