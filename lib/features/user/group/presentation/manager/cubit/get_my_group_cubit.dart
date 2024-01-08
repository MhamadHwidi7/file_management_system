import 'package:bloc/bloc.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_my_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_group_params.dart';
import 'package:file_management_project/features/user/group/domain/use_case/get_my_group_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'get_my_group_state.dart';
part 'get_my_group_cubit.freezed.dart';

const initialPage = 1;

@injectable
class GetMyGroupCubit extends Cubit<GetMyGroupState<GetMyGroupEntity?>> {
  final GetMyGroupUseCase _getMyGroupUseCase;

  GetMyGroupCubit(
    this._getMyGroupUseCase,
  ) : super(const GetMyGroupState.loading());

  int currentPage = initialPage;
  bool canLoadMoreData = true;

  Future<void> emitMyGroup({bool loadMore = false}) async {
    if (!canLoadMoreData) {
      return;
    }

    GetGroupParams getGroupParams = GetGroupParams(page: currentPage);
    final response = await _getMyGroupUseCase.call(getGroupParams);
    response.fold(
        (l) => emit(GetMyGroupState.error(l)),
        (r) => r.when(
              success: (data) {
                canLoadMoreData = data.data.lastPage != null &&
                    data.data.currentPage! < data.data.lastPage!;
                currentPage++;
                emit(GetMyGroupState.success(
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
                emit(GetMyGroupState.error(exception));
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
