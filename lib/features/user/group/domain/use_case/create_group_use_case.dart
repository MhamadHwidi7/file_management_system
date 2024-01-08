import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/domain/params/create_group_params.dart';
import 'package:file_management_project/features/user/group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class CreateGroupUseCase {
  final GroupBaseRepository _groupBaseRepository;

  CreateGroupUseCase(this._groupBaseRepository);

  Future<ApiResult<void>> call(CreateGroupParams createGroupParams) async {
    return await _groupBaseRepository.createGroup(createGroupParams);
  }
}
