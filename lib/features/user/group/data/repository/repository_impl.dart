import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/group/data/data_source/remote_data_source/remote_data_source.dart';
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
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: GroupBaseRepository)
class GroupRepositoryImpl implements GroupBaseRepository {
  final GroupBaseRemoteDataSource _groupBaseRemoteDataSource;

  GroupRepositoryImpl(this._groupBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, void>> addFileToGroup(
      AddFileToGroupParams addFileToGroupParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response =
          await _groupBaseRemoteDataSource.addFileToGroup(addFileToGroupParams);
      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /* } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<ApiResult<void>> createGroup(
      CreateGroupParams createGroupParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response =
          await _groupBaseRemoteDataSource.createGroup(createGroupParams);
      return ApiResult.success(response);
    } on Exception catch (ex) {
      return ApiResult.error(NetworkExceptions.getException(ex));
    }
    /*  } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<ApiResult<void>> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams) async {
    //   if (await _networkInfo.isConnected) {
    try {
      final response = await _groupBaseRemoteDataSource
          .deleteFileFromGroup(deleteFileFromGroupParams);
      return ApiResult.success(response);
    } on Exception catch (exc) {
      return ApiResult.error(NetworkExceptions.getException(exc));
    }
    /* } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, void>> deleteGroup(
      DeleteGroupParams deleteGroupParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response =
          await _groupBaseRemoteDataSource.deleteGroup(deleteGroupParams);
      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /*} else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, GetAllFileCheckInGroupEntity>>
      getCheckInFiles(
          GetAllFileCheckInGroupParams getAllFileCheckInGroupParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response = await _groupBaseRemoteDataSource
          .getCheckInFiles(getAllFileCheckInGroupParams);

      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /*  } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, GetAllUsersInGroupEntity>> getUsersGroup(
      GetAllUserInGroupParams getAllUserInGroupParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response = await _groupBaseRemoteDataSource
          .getUsersGroup(getAllUserInGroupParams);
      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /* } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<
          Either<NetworkExceptions,
              ApiResult<BaseEntity<PaginationEntity<UsersSystemEntity>>>>>
      usersSystem(GetAllUserInSystemParams getAllUserInSystemParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response = await _groupBaseRemoteDataSource
          .usersSystem(getAllUserInSystemParams);
      return Right(ApiResult.success(response));
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    // } else {
    //  return const Left(NetworkExceptions.noInternetConnection());
    // }
  }

  @override
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedGroupFileEntity>>>>
      getGroupsFilePaginated(
          PaginatedGroupFileParams paginatedGroupFileParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response = await _groupBaseRemoteDataSource
          .getGroupFile(paginatedGroupFileParams);
      return ApiResult.success(response);
    } on Exception catch (ex) {
      return ApiResult.error(NetworkExceptions.getException(ex));
    }
    /* } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, void>> addUserToGroup(
      AddUserToGroupParams addUserToGroupParams) async {
    try {
      final response =
          await _groupBaseRemoteDataSource.addUserToGroup(addUserToGroupParams);
      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, void>> deleteUserFromGroup(
      DeleteUserFromGroupParams deleteUserFromGroupParams) async {
    try {
      final response = await _groupBaseRemoteDataSource
          .deleteUserFromGroup(deleteUserFromGroupParams);
      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
  }

  @override
  Future<
          Either<NetworkExceptions,
              ApiResult<BaseEntity<PaginationEntity<GetMyGroupEntity>>>>>
      getMyGroup(GetGroupParams getGroupParams) async {
    try {
      final response =
          await _groupBaseRemoteDataSource.getMyGroup(getGroupParams);
      return Right(ApiResult.success(response));
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
  }
}
