import 'package:dio/dio.dart';
import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/files/add_file/domain/entities/add_files_entity.dart';
import 'package:file_management_project/features/user/files/add_file/domain/params/add_file_params.dart';

import 'package:injectable/injectable.dart';

abstract class AddFileBaseRemoteDataSource {
  Future<AddFilesEntity> addFile(AddFilesParams addFilesParams);
}

@Singleton(as: AddFileBaseRemoteDataSource)
class AddFileRemoteDataSource implements AddFileBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AddFileRemoteDataSource(this._apiConsumer);

  @override
  Future<AddFilesEntity> addFile(AddFilesParams addFilesParams) async {
    final response = await _apiConsumer.post(EndPoints.addFile,
        body: formAddFile(addFilesParams));

    return AddFilesEntity.fromJson(response);
  }

  Future<FormData> formAddFile(AddFilesParams addFilesParams) async {
    return FormData.fromMap({
      'path': await MultipartFile.fromFile(addFilesParams.filePath.path),
      'token': addFilesParams.token
    });
  }
}
