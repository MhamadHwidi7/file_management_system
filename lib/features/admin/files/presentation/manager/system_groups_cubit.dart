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

part 'system_groups_cubit.freezed.dart';
part 'system_groups_state.dart';

@injectable
class SystemGroupsCubit
    extends Cubit<SystemGroupsState<PaginatedSystemGroup?>> {
  final GetSystemGroupsUseCase _getSystemGroupsUseCase;
  SystemGroupsCubit(
    this._getSystemGroupsUseCase,
  ) : super(const SystemGroupsState.loading());
  int currentPage = 1;
  int? lastPage;
  List<PaginatedSystemGroup?> _groups = [];

  Future<void> emitGetSystemGroups({
    bool loadMore = false,
  }) async {
    if (loadMore) {
      if (lastPage != null && currentPage > lastPage!) return;
      currentPage++;
    } else {
      currentPage = 1;
      emit(const SystemGroupsState.loading());
    }

    var response =
        await _getSystemGroupsUseCase(SystemGroupsParams(page: currentPage));
    response.when(
      success: (BaseEntity<PaginationEntity<PaginatedSystemGroup>> model) {
        lastPage = model.data.lastPage;
        _addIncomingDataToClassMemberData(loadMore, model);
        emit(SystemGroupsState.success(_groups, currentPage));
      },
      error: (NetworkExceptions exception) {
        if (kDebugMode) {
          print(exception);
        }
        emit(SystemGroupsState.error(exception));
      },
    );
  }

  void _addIncomingDataToClassMemberData(bool loadMore,
      BaseEntity<PaginationEntity<PaginatedSystemGroup?>> model) {
    if (loadMore) {
      _groups.addAll(model.data.data);
    } else {
      _groups = model.data.data;
    }
  }
}
