import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/nav_bar/presentation/widgets/all_user_system_tile.dart';
import 'package:file_management_project/features/user/group/domain/entities/users_system_entity.dart';
import 'package:file_management_project/features/user/group/presentation/manager/get_all_user_system_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowAllUserInSystemScreen extends StatefulWidget {
  const ShowAllUserInSystemScreen({super.key});

  @override
  State<ShowAllUserInSystemScreen> createState() =>
      _ShowAllUserInSystemScreenState();
}

class _ShowAllUserInSystemScreenState extends State<ShowAllUserInSystemScreen> {
  @override
  void initState() {
    context.read<GetAllUserSystemCubit>().emitGetAllUsersSystem();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Files Screen'),
      ),
      body: _buildAllFilesConsumer(),
    );
  }

  Widget _buildAllFilesConsumer() {
    return BlocConsumer<GetAllUserSystemCubit,
        GetAllUserSystemState<UsersSystemEntity?>>(
      bloc: context.read<
          GetAllUserSystemCubit>(), // Use context.read to get the cubit instance
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) => Fluttertoast.showToast(
            msg: NetworkExceptions.getErrorMessage(exception),
            toastLength: Toast.LENGTH_LONG,
          ),
          success: (entity, canLoadMore) {
            context
                .read<GetAllUserSystemCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<GetAllUserSystemCubit>().canLoadMoreData) {
              context
                  .read<GetAllUserSystemCubit>()
                  .refreshController
                  .loadNoData();
            } else {
              context
                  .read<GetAllUserSystemCubit>()
                  .refreshController
                  .loadComplete();
            }
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Text('Try again');
          },
          loading: () => const Center(child: CupertinoActivityIndicator()),
          success: (entity, _) {
            return CustomPaginationWidget(
              listTobePaginated: ListView.builder(
                itemCount: entity.length,
                itemBuilder: (context, index) {
                  final pokemon = entity[index];
                  return AllUsersSystemTile(user: pokemon);
                },
              ),
              refreshController:
                  context.read<GetAllUserSystemCubit>().refreshController,
              onLoading: () {
                context.read<GetAllUserSystemCubit>().emitGetAllUsersSystem();
              },
            );
          },
          error: (exception) => Center(
            child: Text(
              NetworkExceptions.getErrorMessage(exception),
            ),
          ),
        );
      },
    );
  }
}
