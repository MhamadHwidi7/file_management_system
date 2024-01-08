import 'dart:io';

class SaveFileParams {
  final int id;
  final File path;

  SaveFileParams(this.id, this.path);

  Map<String, dynamic> toJson() => {
        "file_id": id,
        "path": path,
      };
}
