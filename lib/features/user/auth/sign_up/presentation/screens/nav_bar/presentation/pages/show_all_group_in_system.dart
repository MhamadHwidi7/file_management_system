import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/system_groups_cubit.dart';
import 'package:file_management_project/features/admin/files/presentation/widgets/group_system_tile.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllGroupInSystemScreen extends StatefulWidget {
  const ShowAllGroupInSystemScreen({super.key});

  @override
  State<ShowAllGroupInSystemScreen> createState() =>
      _ShowAllGroupInSystemScreenState();
}

class _ShowAllGroupInSystemScreenState
    extends State<ShowAllGroupInSystemScreen> {
  @override
  void initState() {
    context.read<SystemGroupsCubit>().emitGetSystemGroups();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildGroupSystemConsumer(),
    );
  }

  Widget _buildGroupSystemConsumer() {
    return BlocConsumer<SystemGroupsCubit, SystemGroupsState>(
      bloc: context.read<
          SystemGroupsCubit>(), // Use context.read to get the cubit instance
      listener: (context, state) {
        state.whenOrNull(
          // error: (NetworkExceptions exception) => Fluttertoast.showToast(
          //   msg: NetworkExceptions.getErrorMessage(exception),
          //   toastLength: Toast.LENGTH_LONG,
          // ),
          success: (entity, canLoadMore) {
            context
                .read<SystemGroupsCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<SystemGroupsCubit>().canLoadMoreData) {
              context.read<SystemGroupsCubit>().refreshController.loadNoData();
            } else {
              context
                  .read<SystemGroupsCubit>()
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
                  return GroupSystemTile(pokemon: pokemon);
                },
              ),
              refreshController:
                  context.read<SystemGroupsCubit>().refreshController,
              onLoading: () {
                context.read<SystemGroupsCubit>().emitGetSystemGroups();
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
