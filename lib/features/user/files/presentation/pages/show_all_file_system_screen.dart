import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/presentation/manager/files_cubit.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/files/presentation/widget/all_file_system_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowAllFileInSystemScreen extends StatefulWidget {
  const ShowAllFileInSystemScreen({super.key});

  @override
  State<ShowAllFileInSystemScreen> createState() =>
      _ShowAllFileInSystemScreenState();
}

class _ShowAllFileInSystemScreenState extends State<ShowAllFileInSystemScreen> {
  @override
  void initState() {
    context.read<GetAllFilesSystemCubit>().emitGetAllFilesSystem();
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
    return BlocConsumer<GetAllFilesSystemCubit, FileState>(
      bloc: context.read<
          GetAllFilesSystemCubit>(), // Use context.read to get the cubit instance
      listener: (context, state) {
        print(state);
        state.whenOrNull(
          error: (NetworkExceptions exception) => Fluttertoast.showToast(
            msg: NetworkExceptions.getErrorMessage(exception),
            toastLength: Toast.LENGTH_LONG,
          ),
          success: (entity, canLoadMore) {
            context
                .read<GetAllFilesSystemCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<GetAllFilesSystemCubit>().canLoadMoreData) {
              context
                  .read<GetAllFilesSystemCubit>()
                  .refreshController
                  .loadNoData();
            } else {
              context
                  .read<GetAllFilesSystemCubit>()
                  .refreshController
                  .loadComplete();
            }
          },
        );
      },
      builder: (context, state) {
        print(state);
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
                  return AllFilesSystemTile(pokemon: pokemon);
                },
              ),
              refreshController:
                  context.read<GetAllFilesSystemCubit>().refreshController,
              onLoading: () {
                context.read<GetAllFilesSystemCubit>().emitGetAllFilesSystem();
              },
            );
          },
          error: (NetworkExceptions exceptions) => Center(
            child: Text(
              NetworkExceptions.getErrorMessage(exceptions),
            ),
          ),
        );
      },
    );
  }
}
