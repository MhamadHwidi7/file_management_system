import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/domain/params/delete_file_from_group_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteFileFromGroupUseCase {
  final GroupBaseRepository _groupBaseRepository;

  DeleteFileFromGroupUseCase(this._groupBaseRepository);

  Future<ApiResult<void>> call(
      DeleteFileFromGroupParams deleteFileFromGroupParams) async {
    return await _groupBaseRepository
        .deleteFileFromGroup(deleteFileFromGroupParams);
  }
}
