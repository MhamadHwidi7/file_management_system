import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/paginated_group_file.dart';
import 'package:file_management_project/features/user/group/domain/params/paginated_group_file_params.dart';
import 'package:file_management_project/features/user/group/domain/use_case/paginated_group_file_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
part 'paginated_group_file_cubit.freezed.dart';
part 'paginated_group_file_state.dart';

const initialPage = 1;

@injectable
class PaginatedGroupFileCubit
    extends Cubit<PaginatedGroupFileState<PaginatedGroupFileEntity?>> {
  final PaginatedGroupFileUseCase _paginatedGroupFileUseCase;
  PaginatedGroupFileCubit(
    this._paginatedGroupFileUseCase,
  ) : super(const PaginatedGroupFileState.loading());
  int currentPage = initialPage;
  bool canLoadMoreData = true;
  Future<void> emitGetGroupFilePaginated({
    bool loadMore = false,
    required int groupId,
  }) async {
    PaginatedGroupFileParams paginatedGroupFileParams =
        PaginatedGroupFileParams(groupId: groupId, page: currentPage);
    var response = await _paginatedGroupFileUseCase.call(
        paginatedGroupFileParams: paginatedGroupFileParams);
    response.when(
      success: (data) {
        canLoadMoreData = data.data.lastPage != null &&
            data.data.currentPage! < data.data.lastPage!;

        currentPage++;
        emit(PaginatedGroupFileState.success(
            data: state.maybeWhen(
              orElse: () => [...data.data.data],
              success: (q, canLoadMore) => [...q, ...data.data.data],
            ),
            canLoadMore: canLoadMoreData));
      },
      error: (NetworkExceptions exception) {
        if (kDebugMode) {
          print(exception);
        }
        emit(PaginatedGroupFileState.error(exception));
      },
    );
  }

  final RefreshController refreshController = RefreshController();

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
