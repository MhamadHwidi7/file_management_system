import 'package:file_management_project/features/admin/files/domain/entities/system_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupSystemTile extends StatelessWidget {
  const GroupSystemTile({
    super.key,
    required this.pokemon,
  });

  final PaginatedSystemGroup? pokemon;

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
                pokemon!.groupName!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      );
}
