import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/features/user/files/domain/params/save_file_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class SaveFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  SaveFileUseCase(this._fileBaseRepository);

  Future<Either<NetworkExceptions, void>> call(
      SaveFileParams saveFileParams) async {
    return await _fileBaseRepository.saveFile(saveFileParams);
  }
}
