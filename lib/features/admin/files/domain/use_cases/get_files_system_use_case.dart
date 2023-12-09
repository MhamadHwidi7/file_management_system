import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_system.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_system_params.dart';
import 'package:file_management_project/features/admin/files/domain/repository/base_repository.dart';

import 'package:injectable/injectable.dart';

@singleton
class GetFilesSystemUseCase {
  final AdminSystemBaseRepository _adminSystemBaseRepository;

  GetFilesSystemUseCase(this._adminSystemBaseRepository);

  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedFilesSystem>>>> call(
      FilesParams filesSystemParams) async {
    return await _adminSystemBaseRepository
        .getFilesSystemPaginated(filesSystemParams);
  }
}
