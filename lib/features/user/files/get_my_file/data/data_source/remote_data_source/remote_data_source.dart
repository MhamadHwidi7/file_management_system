import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/entities/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/get_my_file/domain/params/get_my_files_params.dart';
import 'package:injectable/injectable.dart';

abstract class GetMyFilesBaseRemoteDataSource {
  Future<GetMyFilesEntity> getMyFiles(GetMyFilesParams getMyFilesParams);
}

@Singleton(as: GetMyFilesBaseRemoteDataSource)
class GetMyFilesRemoteDataSourceImpl implements GetMyFilesBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  GetMyFilesRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<GetMyFilesEntity> getMyFiles(GetMyFilesParams getMyFilesParams) async {
    final response = await _apiConsumer.get(EndPoints.getMyFiles,
        queryParameters: getMyFilesParams.toJson());
    return GetMyFilesEntity.fromJson(response);
  }
}
