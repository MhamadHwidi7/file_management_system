import 'dart:io';

class AddFilesParams {
  final File filePath;
  final String token;

  AddFilesParams(this.filePath, this.token);

  Map<String, dynamic> toJson() => {
        "path": filePath,
        "token": token,
      };
}
