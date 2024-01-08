import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/params/add_user_to_group_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddUserToGroupUseCase {
  final GroupBaseRepository _groupBaseRepository;

  AddUserToGroupUseCase(this._groupBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      AddUserToGroupParams addUserToGroupParams) async {
    return await _groupBaseRepository.addUserToGroup(addUserToGroupParams);
  }
}
