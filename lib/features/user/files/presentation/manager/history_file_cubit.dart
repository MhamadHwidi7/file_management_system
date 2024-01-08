import 'package:bloc/bloc.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/history_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/history_file_params.dart';
import 'package:file_management_project/features/user/files/domain/use_case/history_file_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
part 'history_file_state.dart';

part 'history_file_cubit.freezed.dart';

const initialPage = 1;

@injectable
class HistoryFileCubit extends Cubit<HistoryFileState<HistoryFileEntity?>> {
  final HistoryFileUseCase _historyFileUseCase;

  HistoryFileCubit(this._historyFileUseCase)
      : super(const HistoryFileState.loading());

  int currentPage = initialPage;
  bool canLoadMoreData = true;
  Future<void> emitGetHistoryFilePaginated(
      {bool loadMore = false, required int fileId}) async {
    if (!canLoadMoreData) {
      return;
    }

    HistoryFileParams historyFileParams =
        HistoryFileParams(fileId: fileId, page: currentPage);

    var response = await _historyFileUseCase.call(historyFileParams);
    response.fold(
        (l) => emit(HistoryFileState.error(l)),
        (r) => r.when(
              success: (data) {
                canLoadMoreData = data.data.lastPage != null &&
                    data.data.currentPage! < data.data.lastPage!;
                currentPage++;
                emit(HistoryFileState.success(
                    data: state.maybeWhen(
                      orElse: () => [...data.data.data],
                      success: (sys, canLoadMore) =>
                          [...sys, ...data.data.data],
                    ),
                    canLoadMore: canLoadMoreData));
              },
              error: (NetworkExceptions exception) {
                if (kDebugMode) {
                  print(exception);
                }
                emit(HistoryFileState.error(exception));
              },
            ));
  }

  final RefreshController refreshController = RefreshController();

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
