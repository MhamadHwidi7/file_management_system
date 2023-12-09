import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_group.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_system.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/system_group.dart';
import 'package:file_management_project/features/admin/files/domain/params/change_file_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_group_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_system_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/system_group_params.dart';

abstract class AdminSystemBaseRepository {
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedFilesSystem>>>>
      getFilesSystemPaginated(FilesParams filesSystemParams);
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedFilesGroup>>>>
      getFilesGroupPaginated(FilesGroupParams filesGroupParams);
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedSystemGroup>>>>
      getSystemGroupsPaginated(SystemGroupsParams systemGroupsParams);
  Future<Either<NetworkExceptions, void>> changeFile(
      ChangeFileNumParams changeFileNumParams);
}
