import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/user_model.dart';
import '../../../services/firebase_firestore_service.dart';
import '../user_profile_controller.dart';
import '../update_user.dart';

class AllUsers extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: _firestoreService.getUsersData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: primaryColor);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          List<UserModel> users = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Users",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: 10.0, // Adjust as needed
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
                    DataColumn(
                      label: Text("Actions"),
                    ),
                  ],
                  rows: users.map((user) {
                    return DataRow(
                      cells: [
                        DataCell(Text(user.name ?? "")),
                        DataCell(Text(user.type ?? "")),
                        DataCell(Text(user.email ?? "")),
                        DataCell(
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  UserProfileController profileController = Get.put(UserProfileController());
                                  profileController.setDataFromUserModel(user);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          UpdateUserProfileScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  minimumSize: Size(Get.width * 0.1, Get.height * 0.05),
                                ),
                                child: Text("EDIT", style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

