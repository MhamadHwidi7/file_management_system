import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/admin/files/domain/params/change_file_params.dart';
import 'package:file_management_project/features/admin/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChangeFileNumberUseCase {
  final AdminSystemBaseRepository _adminSystemBaseRepository;

  ChangeFileNumberUseCase(this._adminSystemBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      ChangeFileNumParams changeFileNumParams) async {
    return await _adminSystemBaseRepository.changeFile(changeFileNumParams);
  }
}
