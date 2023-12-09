class EndPoints {
  static const String baseUrl = 'http://192.168.43.75:8000/api';
  static const String signUp = '$baseUrl/user/register';
  static const String logIn = '$baseUrl/user/login';
  static const String addFile = '$baseUrl/add/file';
  static const String deleteFile = '$baseUrl/delete/file';
  static const String getMyFiles = '$baseUrl/getMyFile';
  static const String adminLogIn = '$baseUrl/admin/login';
  static const String adminSignUp = '$baseUrl/admin/register';
  static const String fileSystem = '$baseUrl/getAllFileInSystem';
  static const String fileGroup = '$baseUrl/getAllFileInGroup';
  static const String allGroupInSystem = '$baseUrl/getAllGroupInSystem';
  static const String changeFileNum = '$baseUrl/changeFileNumber';
  static const String historyFile = '$baseUrl/getHistory';
  static const String createGroup = '$baseUrl/CreateGroup';
  static const String addFileToGroup = '$baseUrl/AddFileToGroup';
  static const String deleteFileFromGroup = '$baseUrl/deleteFileFromGroup';
  static const String addUserToGroup = '$baseUrl/addUserToGroup';
  static const String deleteUserFromGroup = '$baseUrl/deleteUserFromGroup';
  static const String deleteGroup = '$baseUrl/deleteGroup';
  static const String getGroupUsers = '$baseUrl/getAllUserInGroup';
}
