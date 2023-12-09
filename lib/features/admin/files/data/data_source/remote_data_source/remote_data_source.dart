import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_group.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_system.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/system_group.dart';
import 'package:file_management_project/features/admin/files/domain/params/change_file_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_group_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_system_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/system_group_params.dart';

import 'package:injectable/injectable.dart';

abstract class GetAllFilesSystemBaseRemoteDataSource {
  Future<BaseEntity<PaginationEntity<PaginatedFilesSystem>>>
      getFilesSystemPaginated(FilesParams filesSystemParams);
  Future<BaseEntity<PaginationEntity<PaginatedFilesGroup>>>
      getFilesGroupPaginated(FilesGroupParams filesGroupParams);
  Future<BaseEntity<PaginationEntity<PaginatedSystemGroup>>>
      getSystemGroupsPaginated(SystemGroupsParams systemGroupsParams);
  Future<void> changeFileNumber(ChangeFileNumParams changeFileNumParams);
}

@Singleton(as: GetAllFilesSystemBaseRemoteDataSource)
class GetAllGroupsSystemRemoteDataSource
    implements GetAllFilesSystemBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  GetAllGroupsSystemRemoteDataSource(this._apiConsumer);

  @override
  Future<BaseEntity<PaginationEntity<PaginatedFilesSystem>>>
      getFilesSystemPaginated(FilesParams filesSystemParams) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.fileSystem,
            queryParameters: filesSystemParams.toJson()),
        (json) => PaginatedFilesSystem.fromJson(json));
  }

  @override
  Future<BaseEntity<PaginationEntity<PaginatedFilesGroup>>>
      getFilesGroupPaginated(FilesGroupParams filesGroupParams) async {
    return await _getResultWithPagination(
        () => _apiConsumer.post(EndPoints.fileGroup,
            body: filesGroupParams.toJson()),
        (json) => PaginatedFilesGroup.fromJson(json));
  }

  @override
  Future<BaseEntity<PaginationEntity<PaginatedSystemGroup>>>
      getSystemGroupsPaginated(SystemGroupsParams systemGroupsParams) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.allGroupInSystem,
            queryParameters: systemGroupsParams.toJson()),
        (json) => PaginatedSystemGroup.fromJson(json));
  }

  Future<BaseEntity<PaginationEntity<T>>> _getResultWithPagination<T>(
      Future<dynamic> Function() api, T Function(dynamic json) fromJson) async {
    var response = await api();

    return BaseEntity.fromJson(
      response,
      (paginated) => PaginationEntity.fromJson(
        paginated,
        (data) => fromJson(data),
      ),
    );
  }

  @override
  Future<void> changeFileNumber(ChangeFileNumParams changeFileNumParams) async {
    return await _apiConsumer.post(EndPoints.changeFileNum,
        body: changeFileNumParams.toJson());
  }
}
