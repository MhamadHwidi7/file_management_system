import 'package:bloc/bloc.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/entites/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/use_case/get_my_files_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_my_files_cubit.freezed.dart';
part 'get_my_files_state.dart';

@injectable
class GetMyFilesCubit extends Cubit<GetMyFilesState<GetMyFilesEntity>> {
  final GetMyFilesUseCase _getMyFilesUseCase;
  GetMyFilesCubit(
    this._getMyFilesUseCase,
  ) : super(const GetMyFilesState.initial());

  Future<void> emitGetMyFiles() async {
    emit(const GetMyFilesState.loading());

    final response = await _getMyFilesUseCase.call();
    response.fold(
        (l) => emit(GetMyFilesState.error(NetworkExceptions.getException(l))),
        (r) => emit(GetMyFilesState.success(r)));
  }
}
