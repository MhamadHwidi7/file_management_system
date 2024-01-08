import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
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
import 'package:injectable/injectable.dart';

abstract class FileBaseRemoteDataSource {
  Future<AddFilesEntity> addFile(AddFilesParams addFilesParams);
  Future<void> reserveInFile(CheckInFileParams checkInFileParams);
  Future<void> reserveOutFile(CheckOutFileParams checkOutFileParams);
  Future<void> deleteFile(DeleteFileParams deleteFileParams);
  Future<GetMyFilesEntity> getMyFiles();
  Future<BaseEntity<PaginationEntity<HistoryFileEntity>>> getFilePaginated(
      HistoryFileParams historyFileParams);
  Future<FileStateEntity> getFileState(FileStateParams fileStateParams);
  Future<ReadFileEntity> readFile(ReadFileParams readFileParams);
  Future<void> saveFile(SaveFileParams saveFileParams);
  Future downloadFile(DownloadFileParams downloadFileParams, String savePath);
}

@Singleton(as: FileBaseRemoteDataSource)
class FileRemoteDataSource implements FileBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  FileRemoteDataSource(this._apiConsumer);
  Future<FormData> formAddFile(AddFilesParams addFilesParams) async {
    final formData = FormData.fromMap({
      'path': await MultipartFile.fromFile(addFilesParams.filePath.path),
    });

    return formData;
  }

  @override
  Future<AddFilesEntity> addFile(AddFilesParams addFilesParams) async {
    final formData = await formAddFile(addFilesParams);

    final response = await _apiConsumer.post(
      EndPoints.addFile,
      body: formData,
    );

    return AddFilesEntity.fromJson(response);
  }

  @override
  Future<GetMyFilesEntity> getMyFiles() async {
    final response = await _apiConsumer.get(
      EndPoints.getMyFiles,
    );
    return GetMyFilesEntity.fromJson(response);
  }

  @override
  Future<void> deleteFile(DeleteFileParams deleteFileParams) async {
    return await _apiConsumer.post(EndPoints.deleteFile,
        queryParameters: deleteFileParams.toJson());
  }

  @override
  Future<void> reserveInFile(CheckInFileParams checkInFileParams) async {
    return await _apiConsumer.post(EndPoints.checkInFile,
        body: checkInFileParams.toJson());
  }

  @override
  Future<void> reserveOutFile(CheckOutFileParams checkOutFileParams) async {
    return await _apiConsumer.post(EndPoints.checkOut,
        body: checkOutFileParams.toJson());
  }

  @override
  Future<FileStateEntity> getFileState(FileStateParams fileStateParams) async {
    final response = await _apiConsumer.post(EndPoints.getStateFile,
        body: fileStateParams.toJson());
    return FileStateEntity.fromJson(response);
  }

  @override
  Future<BaseEntity<PaginationEntity<HistoryFileEntity>>> getFilePaginated(
      HistoryFileParams historyFileParams) async {
    final response = await _apiConsumer.post(EndPoints.historyFile,
        body: historyFileParams.toJson());
    return BaseEntity.fromJson(
        response,
        (json) => PaginationEntity.fromJson(
            json, (json) => HistoryFileEntity.fromJson(json)));
  }

  @override
  Future<ReadFileEntity> readFile(ReadFileParams readFileParams) async {
    final response = await _apiConsumer.post(EndPoints.readFile,
        body: readFileParams.toJson());
    return ReadFileEntity.fromJson(response);
  }

  Future<FormData> formSaveFile(SaveFileParams saveFileParams) async {
    final formData = FormData.fromMap({
      'file_id': saveFileParams.id,
      'file': await MultipartFile.fromFile(saveFileParams.path.path),
    });

    return formData;
  }

  @override
  Future<void> saveFile(SaveFileParams saveFileParams) async {
    final formData = await formSaveFile(saveFileParams);

    return await _apiConsumer.post(EndPoints.saveFile, body: formData);
  }

  @override
  Future<void> downloadFile(
      DownloadFileParams downloadFileParams, String savePath) async {
    return await _apiConsumer.post(EndPoints.downloadFile,
        body: downloadFileParams.toJson(), responseType: ResponseType.bytes);
  }
}
