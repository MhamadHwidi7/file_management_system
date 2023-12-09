import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/delete_file_from_group/domain/params/delete_file_from_group_params.dart';
import 'package:file_management_project/features/user/group/delete_file_from_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeleteFileFromGroupUseCase {
  final DeleteFileFromGroupBaseRepository _deleteFileFromGroupBaseRepository;

  DeleteFileFromGroupUseCase(this._deleteFileFromGroupBaseRepository);

  Future<ApiResult<void>> call(
      DeleteFileFromGroupParams deleteFileFromGroupParams) async {
    return await _deleteFileFromGroupBaseRepository
        .deleteFileFromGroup(deleteFileFromGroupParams);
  }
}
