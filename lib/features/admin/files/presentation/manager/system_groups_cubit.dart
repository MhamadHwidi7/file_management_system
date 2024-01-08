// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/params/system_group_params.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/domain/entities/system_group.dart';
import 'package:file_management_project/features/admin/files/domain/use_cases/get_system_groups_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'system_groups_cubit.freezed.dart';
part 'system_groups_state.dart';

const initialPage = 1;
const limit = 30;

@injectable
class SystemGroupsCubit
    extends Cubit<SystemGroupsState<PaginatedSystemGroup?>> {
  final GetSystemGroupsUseCase _getSystemGroupsUseCase;
  SystemGroupsCubit(
    this._getSystemGroupsUseCase,
  ) : super(const SystemGroupsState.loading());
  int currentPage = initialPage;
  bool canLoadMoreData = true;

  Future<void> emitGetSystemGroups({
    bool loadMore = false,
  }) async {
    if (!canLoadMoreData) {
      return;
    }
    SystemGroupsParams params = SystemGroupsParams(page: currentPage);
    var response = await _getSystemGroupsUseCase.call(params);
    response.when(
      success: (data) {
        canLoadMoreData = data.data.lastPage != null &&
            data.data.currentPage! < data.data.lastPage!;
        currentPage++;
        emit(SystemGroupsState.success(
            data: state.maybeWhen(
                orElse: () {
                  print("Using orElse");
                  return [...data.data.data];
                },
                success: (sys, canLoadMore) => [...sys, ...data.data.data]),
            canLoadMore: canLoadMoreData));
      },
      error: (NetworkExceptions exception) {
        if (kDebugMode) {
          print(exception);
        }
        emit(SystemGroupsState.error(exception));
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
