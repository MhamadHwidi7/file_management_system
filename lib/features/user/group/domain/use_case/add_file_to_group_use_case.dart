import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/params/add_file_to_group_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@singleton
class AddFileToGroupUseCase {
  final GroupBaseRepository _groupBaseRepository;

  AddFileToGroupUseCase(this._groupBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      AddFileToGroupParams addFileToGroupParams) async {
    return await _groupBaseRepository.addFileToGroup(addFileToGroupParams);
  }
}
