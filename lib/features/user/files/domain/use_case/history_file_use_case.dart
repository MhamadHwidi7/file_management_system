import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/history_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/history_file_params.dart';
import 'package:file_management_project/features/user/files/domain/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class HistoryFileUseCase {
  final FileBaseRepository _fileBaseRepository;

  HistoryFileUseCase(this._fileBaseRepository);

  Future<
      Either<NetworkExceptions,
          ApiResult<BaseEntity<PaginationEntity<HistoryFileEntity>>>>> call(
      HistoryFileParams historyFileParams) async {
    return await _fileBaseRepository.getHistoryPaginated(historyFileParams);
  }
}
