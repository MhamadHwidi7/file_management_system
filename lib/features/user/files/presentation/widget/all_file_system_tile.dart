import 'package:file_management_project/features/admin/files/domain/entities/files_system.dart';
import 'package:flutter/material.dart';

class AllFilesSystemTile extends StatelessWidget {
  const AllFilesSystemTile({
    super.key,
    required this.pokemon,
  });

  final PaginatedFilesSystem? pokemon;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon!.filePath,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      );
}
