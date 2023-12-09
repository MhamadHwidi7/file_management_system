import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/group/add_file_to_group/domain/params/add_file_to_group_params.dart';

abstract class AddFileToGroupBaseRepository {
  Future<Either<NetworkExceptions, void>> addFileToGroup(
      AddFileToGroupParams addFileToGroupParams);
}
