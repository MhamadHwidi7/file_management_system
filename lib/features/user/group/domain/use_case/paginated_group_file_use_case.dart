import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/paginated_group_file.dart';
import 'package:file_management_project/features/user/group/domain/params/paginated_group_file_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class PaginatedGroupFileUseCase {
  final GroupBaseRepository _groupBaseRepository;

  PaginatedGroupFileUseCase(this._groupBaseRepository);
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedGroupFileEntity>>>>
      call({required PaginatedGroupFileParams paginatedGroupFileParams}) async {
    return await _groupBaseRepository
        .getGroupsFilePaginated(paginatedGroupFileParams);
  }
}
