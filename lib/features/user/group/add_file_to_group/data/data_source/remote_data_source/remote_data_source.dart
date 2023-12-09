import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/group/add_file_to_group/domain/params/add_file_to_group_params.dart';
import 'package:injectable/injectable.dart';

abstract class AddFileToGroupBaseRemoteDataSource {
  Future<void> addFileToGroup(AddFileToGroupParams addFileToGroupParams);
}

@Singleton(as: AddFileToGroupBaseRemoteDataSource)
class AddFileToGroupRemoteDataSource
    implements AddFileToGroupBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AddFileToGroupRemoteDataSource(this._apiConsumer);

  @override
  Future<void> addFileToGroup(AddFileToGroupParams addFileToGroupParams) async {
    return await _apiConsumer.post(EndPoints.addFileToGroup,
        body: addFileToGroupParams.toJson());
  }
}
