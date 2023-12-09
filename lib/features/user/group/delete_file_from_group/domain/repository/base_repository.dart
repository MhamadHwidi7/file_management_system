import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/delete_file_from_group/domain/params/delete_file_from_group_params.dart';

abstract class DeleteFileFromGroupBaseRepository {
  Future<ApiResult<void>> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams);
}
