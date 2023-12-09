import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/system_group.dart';
import 'package:file_management_project/features/admin/files/domain/params/system_group_params.dart';
import 'package:file_management_project/features/admin/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetSystemGroupsUseCase {
  final AdminSystemBaseRepository _adminSystemBaseRepository;

  GetSystemGroupsUseCase(this._adminSystemBaseRepository);

  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedSystemGroup>>>> call(
      SystemGroupsParams systemGroupsParams) async {
    return await _adminSystemBaseRepository
        .getSystemGroupsPaginated(systemGroupsParams);
  }
}
