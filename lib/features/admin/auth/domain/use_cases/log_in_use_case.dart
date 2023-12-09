import '../../../../../core/utils/api_result.dart';
import '../entities/log_in_entity.dart';
import '../params/log_in_params.dart';
import '../repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminLogInUseCase {
  final AdminAuthBaseRepository _adminAuthBaseRepository;

  AdminLogInUseCase(this._adminAuthBaseRepository);

  Future<ApiResult<AdminLogInEntity>> call(
      AdminLogInParams adminLogInParams) async {
    return await _adminAuthBaseRepository.adminLogIn(adminLogInParams);
  }
}
