import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/files/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:file_management_project/features/user/files/domain/entites/add_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/file_state_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/history_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/read_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/add_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/check_in_params.dart';
import 'package:file_management_project/features/user/files/domain/params/check_out_params.dart';
import 'package:file_management_project/features/user/files/domain/params/delete_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/download_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/file_state_params.dart';
import 'package:file_management_project/features/user/files/domain/params/history_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/read_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/save_file_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FileBaseRepository)
class FileRepositoryImpl implements FileBaseRepository {
  final FileBaseRemoteDataSource _fileBaseRemoteDataSource;

  FileRepositoryImpl(this._fileBaseRemoteDataSource);

  @override
  Future<Either<NetworkExceptions, AddFilesEntity>> addFile(
      AddFilesParams addFilesParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final respone = await _fileBaseRemoteDataSource.addFile(addFilesParams);
      return Right(respone);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /* } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, void>> reserveInFile(
      CheckInFileParams checkInFileParams) async {
    //if (await _networkInfo.isConnected) {
    try {
      final response =
          await _fileBaseRemoteDataSource.reserveInFile(checkInFileParams);
      return Right(response);
    } on Exception catch (ex) {
      print(ex);
      print("xxxxxx");
      return Left(NetworkExceptions.getException(ex));
    }
    /* } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, void>> reserveOutFile(
      CheckOutFileParams checkOutFileParams) async {
    //  if (await _networkInfo.isConnected) {
    try {
      final response =
          await _fileBaseRemoteDataSource.reserveOutFile(checkOutFileParams);
      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /* } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, void>> deleteFile(
      DeleteFileParams deleteFileParams) async {
    //  if (await _networkInfo.isConnected) {
    try {
      final response =
          await _fileBaseRemoteDataSource.deleteFile(deleteFileParams);
      return Right(response);
    } on Exception catch (exc) {
      return Left(NetworkExceptions.getException(exc));
    }
    /*   } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, GetMyFilesEntity>> getMyFiles() async {
    // if (await _networkInfo.isConnected) {
    try {
      final response = await _fileBaseRemoteDataSource.getMyFiles();
      return Right(response);
    } on Exception catch (exc) {
      return Left(NetworkExceptions.getException(exc));
    }
    /*  } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, FileStateEntity>> getFileState(
      FileStateParams fileStateParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response =
          await _fileBaseRemoteDataSource.getFileState(fileStateParams);
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
              ApiResult<BaseEntity<PaginationEntity<HistoryFileEntity>>>>>
      getHistoryPaginated(HistoryFileParams historyFileParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final respoonse =
          await _fileBaseRemoteDataSource.getFilePaginated(historyFileParams);
      return Right(ApiResult.success(respoonse));
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /*  } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, ReadFileEntity>> readFile(
      ReadFileParams readFileParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response = await _fileBaseRemoteDataSource.readFile(readFileParams);
      return Right(response);
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getException(ex));
    }
    /* } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, void>> saveFile(
      SaveFileParams saveFileParams) async {
    // if (await _networkInfo.isConnected) {
    try {
      final response = await _fileBaseRemoteDataSource.saveFile(saveFileParams);
      return Right(response);
    } on Exception catch (exc) {
      return Left(NetworkExceptions.getException(exc));
    }
    /* } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }*/
  }

  @override
  Future<Either<NetworkExceptions, void>> downloadFile(
      DownloadFileParams downloadFileParams, String savePath) async {
    try {
      final response = await _fileBaseRemoteDataSource.downloadFile(
          downloadFileParams, savePath);
      return Right(response);
    } on Exception catch (exc) {
      print(exc);
      return Left(NetworkExceptions.getException(exc));
    }
  }
}
