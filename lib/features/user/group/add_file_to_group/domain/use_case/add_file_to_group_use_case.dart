import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/add_file_to_group/domain/params/add_file_to_group_params.dart';
import 'package:file_management_project/features/user/group/add_file_to_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddFileToGroupUseCase {
  final AddFileToGroupBaseRepository _addFileToGroupBaseRepository;

  AddFileToGroupUseCase(this._addFileToGroupBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      AddFileToGroupParams addFileToGroupParams) async {
    return await _addFileToGroupBaseRepository
        .addFileToGroup(addFileToGroupParams);
  }
}
