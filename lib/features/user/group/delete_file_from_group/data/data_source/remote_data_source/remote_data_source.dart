import 'package:file_management_project/features/user/group/delete_file_from_group/domain/params/delete_file_from_group_params.dart';
import 'package:injectable/injectable.dart';

abstract class DeleteFileFromGroupBaseRemoteDataSource {
  Future<void> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams);
}

@Singleton(as: DeleteFileFromGroupBaseRemoteDataSource)
class DeleteFileFromGroupRemoteDataSource
    implements DeleteFileFromGroupBaseRemoteDataSource {
  @override
  Future<void> deleteFileFromGroup(
      DeleteFileFromGroupParams deleteFileFromGroupParams) {
    // TODO: implement deleteFileFromGroup
    throw UnimplementedError();
  }
}
