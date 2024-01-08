// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_all_file_check_in_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_file_check_in_group_params.dart';
import 'package:file_management_project/features/user/group/presentation/manager/get_all_file_check_in_group_cubit.dart';
import 'package:file_management_project/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowFileCheckInGroupScreen extends StatefulWidget {
  final int groupId;

  const ShowFileCheckInGroupScreen({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  @override
  State<ShowFileCheckInGroupScreen> createState() =>
      _ShowFileCheckInGroupScreenState();
}

class _ShowFileCheckInGroupScreenState
    extends State<ShowFileCheckInGroupScreen> {
  @override
  void initState() {
    _refreshData();
    super.initState();
  }

  Future<void> _refreshData() async {
    context
        .read<GetAllFileCheckInGroupCubit>()
        .emitGetAllFileCheckIn(GetAllFileCheckInGroupParams(widget.groupId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File CheckIn Group"),
      ),
      body:
          BlocBuilder<GetAllFileCheckInGroupCubit, GetAllFileCheckInGroupState>(
        builder: (context, state) {
          return _buildFileCheckInList(state);
        },
      ),
    );
  }

  Widget _buildFileCheckInList(GetAllFileCheckInGroupState state) {
    return state.when(
      loading: () => _buildLoading(),
      initial: () => _buildLoading(),
      success: (getAllFileCheckInGroupEntity) {
        return RefreshIndicator(
          onRefresh: () => _refreshData(),
          child: ListView.separated(
            itemCount: getAllFileCheckInGroupEntity.files?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final entity = getAllFileCheckInGroupEntity.files![index];
              return _buildFileCard(entity, index);
            },
          ),
        );
      },
      error: (networkExceptions) => _buildError(networkExceptions),
    );
  }

  Widget _buildFileCard(FileCheckInObject entity, int index) {
    return Card(
      elevation: 5,
      color: index % 2 == 0 ? Colors.blue.shade100 : Colors.green.shade100,
      child: ListTile(
        title: Text(
          entity.path,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          "ID: ${entity.id}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _buildError(NetworkExceptions networkExceptions) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            NetworkExceptions.getErrorMessage(networkExceptions),
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _refreshData(),
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}
