// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_group.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_system.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_group_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_system_params.dart';
import 'package:file_management_project/features/admin/files/domain/use_cases/get_files_group_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/domain/use_cases/get_files_system_use_case.dart';
import 'package:injectable/injectable.dart';

part 'files_cubit.freezed.dart';
part 'files_states.dart';

@injectable
class GetAllFilesSystemCubit extends Cubit<FileState> {
  final GetFilesSystemUseCase _getAllFilesSystemUseCase;
  final GetFilesGroupUseCase _getFilesGroupUseCase;
  int currentPage = 1;
  int? lastPage;
  List<PaginatedFilesSystem?> _files = [];
  List<PaginatedFilesGroup?> _filesGroup = [];

  GetAllFilesSystemCubit(
    this._getAllFilesSystemUseCase,
    this._getFilesGroupUseCase,
  ) : super(const FileState.loading());

  Future<void> emitGetAllFilesSystem({
    bool loadMore = false,
  }) async {
    if (loadMore) {
      if (lastPage != null && currentPage > lastPage!) return;
      currentPage++;
    } else {
      currentPage = 1;
      emit(const FileState.loading());
    }

    var response =
        await _getAllFilesSystemUseCase(FilesParams(page: currentPage));
    response.when(
      success: (BaseEntity<PaginationEntity<PaginatedFilesSystem>> model) {
        lastPage = model.data.lastPage;
        _addIncomingDataToClassMemberDataFilesSystem(loadMore, model);
        emit(FileState.success(_files, currentPage));
      },
      error: (NetworkExceptions exception) {
        if (kDebugMode) {
          print(exception);
        }
        emit(FileState.error(exception));
      },
    );
  }

  Future<void> emitGetFilesGroup({
    bool loadMore = false,
    required int groupId,
  }) async {
    if (loadMore) {
      if (lastPage != null && currentPage > lastPage!) return;
      currentPage++;
    } else {
      currentPage = 1;
      emit(const FileState.loading());
    }

    var response = await _getFilesGroupUseCase(
        FilesGroupParams(page: currentPage, groupId: groupId));
    response.when(
      success: (BaseEntity<PaginationEntity<PaginatedFilesGroup>> model) {
        lastPage = model.data.lastPage;
        _addIncomingDataToClassMemberDataFilesGroup(loadMore, model);
        emit(FileState.success(_filesGroup, currentPage));
      },
      error: (NetworkExceptions exception) {
        if (kDebugMode) {
          print(exception);
        }
        emit(FileState.error(exception));
      },
    );
  }

  void _addIncomingDataToClassMemberDataFilesSystem(bool loadMore,
      BaseEntity<PaginationEntity<PaginatedFilesSystem?>> model) {
    if (loadMore) {
      _files.addAll(model.data.data);
    } else {
      _files = model.data.data;
    }
  }

  void _addIncomingDataToClassMemberDataFilesGroup(
      bool loadMore, BaseEntity<PaginationEntity<PaginatedFilesGroup?>> model) {
    if (loadMore) {
      _filesGroup.addAll(model.data.data);
    } else {
      _filesGroup = model.data.data;
    }
  }
}
