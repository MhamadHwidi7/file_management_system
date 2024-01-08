import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/users_system_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_user_in_system_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllUsersInSystemUseCase {
  final GroupBaseRepository _groupBaseRepository;

  GetAllUsersInSystemUseCase(this._groupBaseRepository);

  Future<
      Either<NetworkExceptions,
          ApiResult<BaseEntity<PaginationEntity<UsersSystemEntity>>>>> call(
      GetAllUserInSystemParams getAllUserInSystemParams) async {
    return await _groupBaseRepository.usersSystem(getAllUserInSystemParams);
  }
}
