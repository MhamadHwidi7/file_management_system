import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/delete_group/domain/params/delete_group_params.dart';
import 'package:file_management_project/features/user/group/delete_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteGroupUseCase {
  final DeleteGroupBaseRepository _deleteGroupBaseRepository;

  DeleteGroupUseCase(this._deleteGroupBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      DeleteGroupParams deleteGroupParams) async {
    return await _deleteGroupBaseRepository.deleteGroup(deleteGroupParams);
  }
}
