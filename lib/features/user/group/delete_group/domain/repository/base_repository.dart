import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/delete_group/domain/params/delete_group_params.dart';

abstract class DeleteGroupBaseRepository {
  Future<Either<NetworkExceptions, void>> deleteGroup(
      DeleteGroupParams deleteGroupParams);
}
