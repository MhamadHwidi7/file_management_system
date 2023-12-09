import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/files/delete_file/domain/params/delete_file_params.dart';
import 'package:injectable/injectable.dart';

abstract class DeleteFileBaseRemoteDataSource {
  Future<void> deleteFile(DeleteFileParams deleteFileParams);
}

@Singleton(as: DeleteFileBaseRemoteDataSource)
class DeleteFileRemoteDataSource implements DeleteFileBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  DeleteFileRemoteDataSource(this._apiConsumer);

  @override
  Future<void> deleteFile(DeleteFileParams deleteFileParams) async {
    return await _apiConsumer.delete(EndPoints.deleteFile,
        queryParameters: deleteFileParams.toJson());
  }
}
