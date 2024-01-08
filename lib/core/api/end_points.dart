class EndPoints {
  static const String baseUrl = 'http://192.168.1.103:8000/api';
  static const String signUp = '$baseUrl/user/register'; //done
  static const String logIn = '$baseUrl/user/login'; //done
  static const String addFile = '$baseUrl/add/file'; //done
  static const String deleteFile = '$baseUrl/delete/file'; //
  static const String getMyFiles = '$baseUrl/getMyFile'; //done
  static const String adminLogIn = '$baseUrl/admin/login'; //done
  static const String adminSignUp = '$baseUrl/admin/register'; //done
  static const String fileSystem =
      '$baseUrl/getAllFileInSystem'; //done ///todo:check for the unauthenticated message if the user show it
  static const String fileGroup = '$baseUrl/getAllFileInGroup'; //
  static const String allGroupInSystem = '$baseUrl/getAllGroupInSystem'; //done
  static const String changeFileNum = '$baseUrl/changeFileNumber'; //
  static const String historyFile = '$baseUrl/getHistory'; //done
  static const String createGroup = '$baseUrl/CreateGroup'; //done
  static const String addFileToGroup = '$baseUrl/AddFileToGroup'; //done
  static const String deleteFileFromGroup =
      '$baseUrl/deleteFileFromGroup'; //done
  static const String addUserToGroup = '$baseUrl/addUserToGroup'; //done
  static const String deleteUserFromGroup =
      '$baseUrl/deleteUserFromGroup'; //done
  static const String deleteGroup = '$baseUrl/deleteGroup'; //
  static const String getStateFile = '$baseUrl/getStateFile'; //done
  static const String getMyGroup = '$baseUrl/getMyGroup'; //done

  ///todo:
  static const String getGroupUsers = '$baseUrl/getAllUserInGroup'; //done
  static const String getAllFilesCheck =
      '$baseUrl/getAllFileCheck_InGroupForUser'; //done
  static const String getGroupFile = '$baseUrl/getGroupFile'; //done
  static const String getAllUserInSystem = '$baseUrl/getAllUserInSystem'; //done

  ///todo:
  static const String checkInFile = '$baseUrl/check_in'; //done
  static const String readFile = '$baseUrl/readFile'; //done
  static const String saveFile = '$baseUrl/saveFile';
  static const String checkOut = '$baseUrl/check_outFile'; //done
  static const String downloadFile = '$baseUrl/downloadfile'; //done
}
