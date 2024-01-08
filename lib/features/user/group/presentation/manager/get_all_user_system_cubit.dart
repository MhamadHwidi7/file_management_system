// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:file_management_project/features/user/group/domain/entities/users_system_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_user_in_system_params.dart';
import 'package:file_management_project/features/user/group/domain/use_case/users_system_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
part 'get_all_user_system_cubit.freezed.dart';
part 'get_all_user_system_state.dart';

const initialPage = 1;

@injectable
class GetAllUserSystemCubit
    extends Cubit<GetAllUserSystemState<UsersSystemEntity?>> {
  final GetAllUsersInSystemUseCase _getAllUsersInSystemUseCase;
  GetAllUserSystemCubit(
    this._getAllUsersInSystemUseCase,
  ) : super(const GetAllUserSystemState.loading());
  int currentPage = initialPage;
  bool canLoadMoreData = true;

  Future<void> emitGetAllUsersSystem({bool loadMore = false}) async {
    if (!canLoadMoreData) {
      return;
    }
    GetAllUserInSystemParams getAllUserInSystemParams =
        GetAllUserInSystemParams(page: currentPage);

    final response =
        await _getAllUsersInSystemUseCase.call(getAllUserInSystemParams);

    response.fold(
        (l) => emit(GetAllUserSystemState.error(l)),
        (r) => r.when(
              success: (data) {
                canLoadMoreData = data.data.lastPage != null &&
                    data.data.currentPage! < data.data.lastPage!;
                currentPage++;
                emit(GetAllUserSystemState.success(
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
                emit(GetAllUserSystemState.error(exception));
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
