import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_my_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/get_group_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetMyGroupUseCase {
  final GroupBaseRepository _groupBaseRepository;

  GetMyGroupUseCase(this._groupBaseRepository);

  Future<
      Either<NetworkExceptions,
          ApiResult<BaseEntity<PaginationEntity<GetMyGroupEntity>>>>> call(
      GetGroupParams getGroupParams) async {
    return await _groupBaseRepository.getMyGroup(getGroupParams);
  }
}
