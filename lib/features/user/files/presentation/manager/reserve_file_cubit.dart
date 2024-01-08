// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/user/files/domain/params/check_in_params.dart';
import 'package:file_management_project/features/user/files/domain/params/check_out_params.dart';
import 'package:file_management_project/features/user/files/domain/use_case/check_in_file_use_case.dart';
import 'package:file_management_project/features/user/files/domain/use_case/check_out_file_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
part 'reserve_file_cubit.freezed.dart';
part 'reserve_file_state.dart';

@injectable
class ReserveFileCubit extends Cubit<ReserveFileState> {
  final CheckInFileUseCase _checkInFileUseCase;
  final CheckOutFileUseCase _checkOutFileUseCase;
  ReserveFileCubit(
    this._checkInFileUseCase,
    this._checkOutFileUseCase,
  ) : super(const ReserveFileState.initial());

  Future<void> emitCheckInFile(CheckInFileParams checkInFileParams) async {
    emit(const ReserveFileState.loading());
    final response = await _checkInFileUseCase.call(checkInFileParams);
    response.fold((l) => emit(ReserveFileState.error(l)),
        (r) => emit(const ReserveFileState.success("Done CheckIn File")));
  }

  Future<void> emitCheckOutFile(CheckOutFileParams checkOutFileParams) async {
    emit(const ReserveFileState.loading());
    final response = await _checkOutFileUseCase.call(checkOutFileParams);
    response.fold((l) => emit(ReserveFileState.error(l)),
        (r) => emit(const ReserveFileState.success("Done CheckOut File")));
  }
}
