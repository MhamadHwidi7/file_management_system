import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/group/delete_group/domain/params/delete_group_params.dart';
import 'package:injectable/injectable.dart';

abstract class DeleteGroupBaseRemoteDataSource {
  Future<void> deleteGroup(DeleteGroupParams deleteGroupParams);
}

@Singleton(as: DeleteGroupBaseRemoteDataSource)
class DeleteGroupRemoteDataSource implements DeleteGroupBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  DeleteGroupRemoteDataSource(this._apiConsumer);

  @override
  Future<void> deleteGroup(DeleteGroupParams deleteGroupParams) async {
    return await _apiConsumer.post(EndPoints.deleteGroup,
        body: deleteGroupParams.toJson());
  }
}
