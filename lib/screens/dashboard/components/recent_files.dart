import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/user_model.dart';
import '../../../services/firebase_firestore_service.dart';

class RecentUsers extends StatelessWidget {
  const RecentUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestoreService = FirestoreService();

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: FutureBuilder<List<UserModel>>(
              future: _firestoreService.getRecentUsers(8),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(color: primaryColor));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No data available');
                } else {
                  List<UserModel> users = snapshot.data!;
                  return DataTable(
                    columnSpacing: defaultPadding,
                    columns: [
                      DataColumn(
                        label: Text("Name"),
                      ),
                      DataColumn(
                        label: Text("Type"),
                      ),
                      DataColumn(
                        label: Text("Email"),
                      ),
                    ],
                    rows:
                        users.map((user) => _recentUserDataRow(user)).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  DataRow _recentUserDataRow(UserModel user) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              CircleAvatar(
                backgroundImage: user.profilePic != "profilePicURL"
                    ? NetworkImage(user.profilePic!)
                    : const NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/sponsor-hub-dnm.appspot.com/o/user_image%2Fuser.jpg?alt=media&token=de49dd69-ce8c-44f9-8a1f-10a09816b1b7"),
                radius: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(user.name ?? ""),
              ),
            ],
          ),
        ),
        DataCell(Text(user.type ?? "")),
        DataCell(Text(user.email ?? "")),
      ],
    );
  }
}
