import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/auth/sign_up/presentation/screens/home_screen.dart';
import 'package:file_management_project/features/user/files/domain/entites/history_file_entity.dart';
import 'package:file_management_project/features/user/files/presentation/manager/history_file_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HistoryScreen extends StatefulWidget {
  final int fileId;
  const HistoryScreen({
    Key? key,
    required this.fileId,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    context
        .read<HistoryFileCubit>()
        .emitGetHistoryFilePaginated(fileId: widget.fileId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Screen'),
      ),
      body: _buildFilesConsumer(),
    );
  }

  Widget _buildFilesConsumer() {
    return BlocConsumer<HistoryFileCubit, HistoryFileState<HistoryFileEntity?>>(
      bloc: context.read<
          HistoryFileCubit>(), // Use context.read to get the cubit instance
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) => Fluttertoast.showToast(
            msg: NetworkExceptions.getErrorMessage(exception),
            toastLength: Toast.LENGTH_LONG,
          ),
          success: (entity, canLoadMore) {
            context
                .read<HistoryFileCubit>()
                .refreshController
                .refreshCompleted();
            if (!context.read<HistoryFileCubit>().canLoadMoreData) {
              context.read<HistoryFileCubit>().refreshController.loadNoData();
            } else {
              context.read<HistoryFileCubit>().refreshController.loadComplete();
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
                  return PokemonTile(pokemon: pokemon);
                },
              ),
              refreshController:
                  context.read<HistoryFileCubit>().refreshController,
              onLoading: () {
                context
                    .read<HistoryFileCubit>()
                    .emitGetHistoryFilePaginated(fileId: widget.fileId);
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

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final HistoryFileEntity? pokemon;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              pokemon!.operationName[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            pokemon!.operationName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                'Date: ${pokemon!.operationDate}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                'User: ${pokemon!.userDataHistoryObject.userName}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                'Email: ${pokemon!.userDataHistoryObject.email}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      );
}
