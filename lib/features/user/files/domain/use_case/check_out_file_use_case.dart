import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/params/check_out_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class CheckOutFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  CheckOutFileUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      CheckOutFileParams checkOutFileParams) async {
    return await _fileBaseRepository.reserveOutFile(checkOutFileParams);
  }
}
