import 'package:file_management_project/features/user/group/domain/entities/users_system_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllUsersSystemTile extends StatelessWidget {
  const AllUsersSystemTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UsersSystemEntity? user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user!.userName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              user!.email,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your action here
                  },
                  child: Text('View Profile'),
                ),
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {
                    // Add your action here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
