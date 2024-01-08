import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
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

abstract class GroupBaseRepository {
  Future<Either<NetworkExceptions, void>> addFileToGroup(
      AddFileToGroupParams addFileToGroupParams);
  Future<ApiResult<void>> createGroup(CreateGroupParams createGroupParams);
  Future<ApiResult<void>> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams);
  Future<Either<NetworkExceptions, void>> deleteGroup(
      DeleteGroupParams deleteGroupParams);
  Future<Either<NetworkExceptions, GetAllFileCheckInGroupEntity>>
      getCheckInFiles(
          GetAllFileCheckInGroupParams getAllFileCheckInGroupParams);
  Future<Either<NetworkExceptions, GetAllUsersInGroupEntity>> getUsersGroup(
      GetAllUserInGroupParams getAllUserInGroupParams);
  Future<
          Either<NetworkExceptions,
              ApiResult<BaseEntity<PaginationEntity<UsersSystemEntity>>>>>
      usersSystem(GetAllUserInSystemParams getAllUserInSystemParams);
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedGroupFileEntity>>>>
      getGroupsFilePaginated(PaginatedGroupFileParams paginatedGroupFileParams);
  Future<Either<NetworkExceptions, void>> addUserToGroup(
      AddUserToGroupParams addUserToGroupParams);
  Future<Either<NetworkExceptions, void>> deleteUserFromGroup(
      DeleteUserFromGroupParams deleteUserFromGroupParams);

  Future<
          Either<NetworkExceptions,
              ApiResult<BaseEntity<PaginationEntity<GetMyGroupEntity>>>>>
      getMyGroup(GetGroupParams getGroupParams);
}
