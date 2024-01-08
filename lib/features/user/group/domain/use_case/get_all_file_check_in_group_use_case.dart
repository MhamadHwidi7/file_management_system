import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_all_file_check_in_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_file_check_in_group_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllFilesCheckInGroupUseCase {
  final GroupBaseRepository _groupBaseRepository;

  GetAllFilesCheckInGroupUseCase(this._groupBaseRepository);

  Future<Either<NetworkExceptions, GetAllFileCheckInGroupEntity>> call(
      GetAllFileCheckInGroupParams getAllFileCheckInGroupParams) async {
    return await _groupBaseRepository
        .getCheckInFiles(getAllFileCheckInGroupParams);
  }
}
