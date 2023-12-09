import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/network/network_info.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_group.dart';
import 'package:file_management_project/features/admin/files/domain/entities/files_system.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/system_group.dart';
import 'package:file_management_project/features/admin/files/domain/params/change_file_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_group_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/files_system_params.dart';
import 'package:file_management_project/features/admin/files/domain/params/system_group_params.dart';
import 'package:file_management_project/features/admin/files/domain/repository/base_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AdminSystemBaseRepository)
class AdminSystemRepositoryImpl implements AdminSystemBaseRepository {
  final NetworkInfo _networkInfo;
  final GetAllFilesSystemBaseRemoteDataSource
      _getAllFilesSystemBaseRemoteDataSource;

  AdminSystemRepositoryImpl(
      this._networkInfo, this._getAllFilesSystemBaseRemoteDataSource);
  @override
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedFilesSystem>>>>
      getFilesSystemPaginated(FilesParams filesSystemParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _getAllFilesSystemBaseRemoteDataSource
            .getFilesSystemPaginated(filesSystemParams);
        return ApiResult.success(response);
      } on Exception catch (ex) {
        if (kDebugMode) {
          print("error$ex");
        }
        return ApiResult.error(NetworkExceptions.getException(ex));
      }
    } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedFilesGroup>>>>
      getFilesGroupPaginated(FilesGroupParams filesGroupParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _getAllFilesSystemBaseRemoteDataSource
            .getFilesGroupPaginated(filesGroupParams);
        return ApiResult.success(response);
      } on Exception catch (ex) {
        if (kDebugMode) {
          print("error$ex");
        }
        return ApiResult.error(NetworkExceptions.getException(ex));
      }
    } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<ApiResult<BaseEntity<PaginationEntity<PaginatedSystemGroup>>>>
      getSystemGroupsPaginated(SystemGroupsParams systemGroupsParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _getAllFilesSystemBaseRemoteDataSource
            .getSystemGroupsPaginated(systemGroupsParams);
        return ApiResult.success(response);
      } on Exception catch (ex) {
        if (kDebugMode) {
          print("error$ex");
        }
        return ApiResult.error(NetworkExceptions.getException(ex));
      }
    } else {
      return const ApiResult.error(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, void>> changeFile(
      ChangeFileNumParams changeFileNumParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _getAllFilesSystemBaseRemoteDataSource
            .changeFileNumber(changeFileNumParams);
        return Right(response);
      } on Exception catch (exc) {
        return Left(NetworkExceptions.getException(exc));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}
