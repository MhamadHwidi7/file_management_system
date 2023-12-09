import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/features/user/group/create_group/domain/params/create_group_params.dart';
import 'package:injectable/injectable.dart';

abstract class CreateGroupBaseRemoteDataSource {
  Future<void> createGroup(CreateGroupParams createGroupParams);
}

@Singleton(as: CreateGroupBaseRemoteDataSource)
class CreateGroupRemoteDataSource implements CreateGroupBaseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CreateGroupRemoteDataSource(this._apiConsumer);
  @override
  Future<void> createGroup(CreateGroupParams createGroupParams) async {
    return await _apiConsumer.post(EndPoints.createGroup,
        body: createGroupParams.toJson());
  }
}
