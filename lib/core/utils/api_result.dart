import '../error/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = _Success;
  const factory ApiResult.error(NetworkExceptions networkExceptions) = _Error;
}
