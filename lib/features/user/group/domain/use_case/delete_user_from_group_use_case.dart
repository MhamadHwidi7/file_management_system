import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_user_from_group_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteUserFromGroupUseCase {
  final GroupBaseRepository _groupBaseRepository;

  DeleteUserFromGroupUseCase(this._groupBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      DeleteUserFromGroupParams deleteUserFromGroupParams) async {
    return await _groupBaseRepository
        .deleteUserFromGroup(deleteUserFromGroupParams);
  }
}
