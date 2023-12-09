import '../../../../../core/utils/api_result.dart';
import '../entities/log_in_entity.dart';
import '../params/log_in_params.dart';
import '../params/sign_up_params.dart';

abstract class AdminAuthBaseRepository {
  Future<ApiResult<void>> adminSignUp(AdminSignUpParams adminSignUpParams);
  Future<ApiResult<AdminLogInEntity>> adminLogIn(
      AdminLogInParams adminLogInParams);
}
