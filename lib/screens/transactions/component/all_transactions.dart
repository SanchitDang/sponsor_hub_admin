import 'package:admin/screens/transactions/add_transaction.dart';
import 'package:admin/screens/transactions/transaction_controller.dart';
import 'package:admin/screens/transactions/update_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../models/transaction_model.dart';
import '../../../services/firebase_firestore_service.dart';
import '../../../widgets/icon_button.dart';

class AllTransactions extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TransactionModel>>(
      future: _firestoreService.getTransactionsData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: primaryColor),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Transactions",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      MyIconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                  AddTransactionScreen(),
                            ),
                          );
                        },
                        label: "Add New",
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ),
                Text('No data available'),
              ],
            ),
          );
        } else {
          List<TransactionModel> transactions = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Transactions",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      MyIconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      AddTransactionScreen(),
                            ),
                          );
                        },
                        label: "Add New",
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columnSpacing: 10.0, // Adjust as needed
                    columns: [
                      DataColumn(
                        label: Text("Transaction ID"),
                      ),
                      DataColumn(
                        label: Text("Name"),
                      ),
                      DataColumn(
                        label: Text("Email"),
                      ),
                      DataColumn(
                        label: Text("Actions"),
                      ),
                    ],
                    rows: transactions.map((transaction) {
                      return DataRow(
                        cells: [
                          DataCell(Text(transaction.transactionId ?? "")),
                          DataCell(Text(transaction.name ?? "")),
                          DataCell(Text(transaction.email ?? "")),
                          DataCell(
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    TransactionController profileController =
                                        Get.put(TransactionController());
                                    profileController
                                        .setDataFromTransactionModel(transaction);

                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            UpdateTransactionScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    minimumSize:
                                        Size(Get.width * 0.1, Get.height * 0.05),
                                  ),
                                  child: Text(
                                    "VIEW",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
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
            ),
          );
        }
      },
    );
  }
}
