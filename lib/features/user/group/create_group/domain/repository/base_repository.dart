import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/create_group/domain/params/create_group_params.dart';

abstract class CreateGroupBaseRepository {
  Future<ApiResult<void>> createGroup(CreateGroupParams createGroupParams);
}
