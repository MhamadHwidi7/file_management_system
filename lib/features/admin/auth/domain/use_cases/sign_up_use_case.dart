import '../../../../../core/utils/api_result.dart';
import '../params/sign_up_params.dart';
import '../repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AdminSignUpUseCase {
  final AdminAuthBaseRepository _adminAuthBaseRepository;

  AdminSignUpUseCase(this._adminAuthBaseRepository);

  Future<ApiResult<void>> call(AdminSignUpParams adminSignUpParams) async {
    return await _adminAuthBaseRepository.adminSignUp(adminSignUpParams);
  }
}
