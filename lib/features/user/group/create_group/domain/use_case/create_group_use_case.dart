import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/user/group/create_group/domain/params/create_group_params.dart';
import 'package:file_management_project/features/user/group/create_group/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class CreateGroupUseCase {
  final CreateGroupBaseRepository _createGroupBaseRepository;

  CreateGroupUseCase(this._createGroupBaseRepository);

  Future<ApiResult<void>> call(CreateGroupParams createGroupParams) async {
    return await _createGroupBaseRepository.createGroup(createGroupParams);
  }
}
