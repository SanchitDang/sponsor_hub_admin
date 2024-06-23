import 'package:admin/constants.dart';
import 'package:admin/screens/consulting/update_consult.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/consult_model.dart';
import '../../../services/firebase_firestore_service.dart';
import '../consult_controller.dart';

class AllConsults extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ConsultModel>>(
      future: _firestoreService.getConsultData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: primaryColor);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          List<ConsultModel> consults = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Consults",
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
                      label: Text("Email"),
                    ),
                    DataColumn(
                      label: Text("Phone"),
                    ),
                    DataColumn(
                      label: Text("Actions"),
                    ),
                  ],
                  rows: consults.map((consult) {
                    return DataRow(
                      cells: [
                        DataCell(Text(consult.name ?? "")),
                        DataCell(Text(consult.email ?? "")),
                        DataCell(Text(consult.phoneNumber ?? "")),
                        DataCell(
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ConsultController profileController = Get.put(ConsultController());
                                  profileController.setDataFromConsultModel(consult);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          UpdateConsultScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  minimumSize: Size(Get.width * 0.1, Get.height * 0.05),
                                ),
                                child: Text("VIEW", style: const TextStyle(
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


