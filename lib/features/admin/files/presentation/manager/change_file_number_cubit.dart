// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/admin/files/domain/params/change_file_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/domain/use_cases/change_file_number_use_case.dart';

part 'change_file_number_cubit.freezed.dart';
part 'change_file_number_state.dart';

@injectable
class ChangeFileNumberCubit extends Cubit<ChangeFileNumberState> {
  final ChangeFileNumberUseCase _changeFileNumberUseCase;
  ChangeFileNumberCubit(
    this._changeFileNumberUseCase,
  ) : super(const ChangeFileNumberState.initial());

  Future<void> emitChangeFile(ChangeFileNumParams changeFileNumParams) async {
    emit(const ChangeFileNumberState.loading());

    final response = await _changeFileNumberUseCase.call(changeFileNumParams);
    response.fold(
        (l) => emit(ChangeFileNumberState.error(l)),

        ///todo:make messages
        (r) => emit(const ChangeFileNumberState.success("Done Change it")));
  }
}
