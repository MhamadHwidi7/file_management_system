import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/params/check_in_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class CheckInFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  CheckInFileUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      CheckInFileParams checkInFileParams) async {
    return await _fileBaseRepository.reserveInFile(checkInFileParams);
  }
}
