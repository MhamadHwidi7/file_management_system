import 'package:file_management_project/features/admin/files/domain/entities/files_group.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_group_params.dart';
import 'package:file_management_project/features/admin/files/domain/repository/base_repository.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetFilesGroupUseCase {
  final AdminSystemBaseRepository _adminSystemBaseRepository;

  GetFilesGroupUseCase(this._adminSystemBaseRepository);

  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedFilesGroup>>>> call(
      FilesGroupParams filesGroupParams) async {
    return await _adminSystemBaseRepository
        .getFilesGroupPaginated(filesGroupParams);
  }
}
