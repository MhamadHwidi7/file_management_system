import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_all_file_check_in_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_all_user_in_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/get_my_group_entity.dart';
import 'package:file_management_project/features/user/group/domain/entities/paginated_group_file.dart';
import 'package:file_management_project/features/user/group/domain/entities/users_system_entity.dart';
import 'package:file_management_project/features/user/group/domain/params/add_file_to_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/add_user_to_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/create_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_file_from_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_user_from_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_file_check_in_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_user_in_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/get_all_user_in_system_params.dart';
import 'package:file_management_project/features/user/group/domain/params/get_group_params.dart';
import 'package:file_management_project/features/user/group/domain/params/paginated_group_file_params.dart';
import 'package:injectable/injectable.dart';

abstract class GroupBaseRemoteDataSource {
  Future<void> addFileToGroup(AddFileToGroupParams addFileToGroupParams);
  Future<void> createGroup(CreateGroupParams createGroupParams);
  Future<void> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams);
  Future<void> deleteGroup(DeleteGroupParams deleteGroupParams);
  Future<GetAllFileCheckInGroupEntity> getCheckInFiles(
      GetAllFileCheckInGroupParams getAllFileCheckInGroupParams);
  Future<GetAllUsersInGroupEntity> getUsersGroup(
      GetAllUserInGroupParams getAllUserInGroupParams);
  Future<BaseEntity<PaginationEntity<UsersSystemEntity>>> usersSystem(
      GetAllUserInSystemParams getAllUserInSystemParams);
  Future<BaseEntity<PaginationEntity<PaginatedGroupFileEntity>>> getGroupFile(
      PaginatedGroupFileParams paginatedGroupFileParams);
  Future<void> addUserToGroup(AddUserToGroupParams addUserToGroupParams);
  Future<void> deleteUserFromGroup(
      DeleteUserFromGroupParams deleteUserFromGroupParams);
  Future<BaseEntity<PaginationEntity<GetMyGroupEntity>>> getMyGroup(
      GetGroupParams getGroupParams);
}

@Singleton(as: GroupBaseRemoteDataSource)
class GroupRemoteDataSource implements GroupBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  GroupRemoteDataSource(this._apiConsumer);

  @override
  Future<void> addFileToGroup(AddFileToGroupParams addFileToGroupParams) async {
    return await _apiConsumer.post(EndPoints.addFileToGroup,
        body: addFileToGroupParams.toJson());
  }

  @override
  Future<void> createGroup(CreateGroupParams createGroupParams) async {
    return await _apiConsumer.post(EndPoints.createGroup,
        body: createGroupParams.toJson());
  }

  @override
  Future<void> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams) async {
    return await _apiConsumer.post(EndPoints.deleteFileFromGroup,
        body: deleteFileFromGroupParams.toJson());
  }

  @override
  Future<void> deleteGroup(DeleteGroupParams deleteGroupParams) async {
    return await _apiConsumer.post(EndPoints.deleteGroup,
        body: deleteGroupParams.toJson());
  }

  @override
  Future<GetAllFileCheckInGroupEntity> getCheckInFiles(
      GetAllFileCheckInGroupParams getAllFileCheckInGroupParams) async {
    final response = await _apiConsumer.post(EndPoints.getAllFilesCheck,
        body: getAllFileCheckInGroupParams.toJson());
    return GetAllFileCheckInGroupEntity.fromJson(response);
  }

  @override
  Future<GetAllUsersInGroupEntity> getUsersGroup(
      GetAllUserInGroupParams getAllUserInGroupParams) async {
    final response = await _apiConsumer.post(EndPoints.getGroupUsers,
        body: getAllUserInGroupParams.toJson());

    return GetAllUsersInGroupEntity.fromJson(response);
  }

  @override
  Future<BaseEntity<PaginationEntity<UsersSystemEntity>>> usersSystem(
      GetAllUserInSystemParams getAllUserInSystemParams) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getAllUserInSystem,
            queryParameters: getAllUserInSystemParams.toJson()),
        (json) => UsersSystemEntity.fromJson(json));
  }

  @override
  Future<BaseEntity<PaginationEntity<PaginatedGroupFileEntity>>> getGroupFile(
      PaginatedGroupFileParams paginatedGroupFileParams) async {
    return await _getResultWithPagination(
        () => _apiConsumer.post(EndPoints.getGroupFile,
            body: paginatedGroupFileParams.toJson()),
        (json) => PaginatedGroupFileEntity.fromJson(json));
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
  Future<void> addUserToGroup(AddUserToGroupParams addUserToGroupParams) async {
    return await _apiConsumer.post(EndPoints.addUserToGroup,
        body: addUserToGroupParams.toJson());
  }

  @override
  Future<void> deleteUserFromGroup(
      DeleteUserFromGroupParams deleteUserFromGroupParams) async {
    return await _apiConsumer.post(EndPoints.deleteUserFromGroup,
        body: deleteUserFromGroupParams.toJson());
  }

  @override
  Future<BaseEntity<PaginationEntity<GetMyGroupEntity>>> getMyGroup(
      GetGroupParams getGroupParams) async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getMyGroup,
            queryParameters: getGroupParams.toJson()),
        (json) => GetMyGroupEntity.fromJson(json));
  }
}
