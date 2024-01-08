import 'package:dartz/dartz.dart';
import 'package:file_management_project/core/error/network_exceptions.dart';
import 'package:file_management_project/core/utils/api_result.dart';
import 'package:file_management_project/features/admin/files/domain/entities/base_entity.dart';
import 'package:file_management_project/features/admin/files/domain/entities/pagination_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/add_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/file_state_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/get_my_files_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/history_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/entites/read_file_entity.dart';
import 'package:file_management_project/features/user/files/domain/params/add_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/check_in_params.dart';
import 'package:file_management_project/features/user/files/domain/params/check_out_params.dart';
import 'package:file_management_project/features/user/files/domain/params/delete_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/download_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/file_state_params.dart';
import 'package:file_management_project/features/user/files/domain/params/history_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/read_file_params.dart';
import 'package:file_management_project/features/user/files/domain/params/save_file_params.dart';

abstract class FileBaseRepository {
  Future<Either<NetworkExceptions, AddFilesEntity>> addFile(
      AddFilesParams addFilesParams);
  Future<Either<NetworkExceptions, void>> reserveInFile(
      CheckInFileParams checkInFileParams);
  Future<Either<NetworkExceptions, void>> reserveOutFile(
      CheckOutFileParams checkOutFileParams);
  Future<Either<NetworkExceptions, void>> deleteFile(
      DeleteFileParams deleteFileParams);
  Future<Either<NetworkExceptions, GetMyFilesEntity>> getMyFiles();
  Future<Either<NetworkExceptions, FileStateEntity>> getFileState(
      FileStateParams fileStateParams);
  Future<
          Either<NetworkExceptions,
              ApiResult<BaseEntity<PaginationEntity<HistoryFileEntity>>>>>
      getHistoryPaginated(HistoryFileParams historyFileParams);
  Future<Either<NetworkExceptions, ReadFileEntity>> readFile(
      ReadFileParams readFileParams);
  Future<Either<NetworkExceptions, void>> saveFile(
      SaveFileParams saveFileParams);
  Future<Either<NetworkExceptions, void>> downloadFile(
      DownloadFileParams downloadFileParams, String savePath);
}
