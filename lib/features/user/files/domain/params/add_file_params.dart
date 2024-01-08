import 'dart:io';

class AddFilesParams {
  final File filePath;

  AddFilesParams(this.filePath);

  Map<String, dynamic> toJson() => {
        "path": filePath,
      };
}
