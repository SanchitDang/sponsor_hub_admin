import 'package:admin/screens/transactions/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';


class UpdateTransactionScreen extends StatelessWidget {
  const UpdateTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.put(TransactionController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Update Transaction",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // -- IMAGE with ICON (if applicable)
                // Adjust based on your transaction model and UI requirements

                // -- Form Fields
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: transactionController.nameController,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: transactionController.emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: transactionController.phoneNumberController,
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: transactionController.sponsorshipTypeController,
                        decoration: const InputDecoration(
                          labelText: "Sponsorship Type",
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: transactionController.addressController,
                        decoration: const InputDecoration(
                          labelText: "Address",
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: transactionController.noteController,
                        decoration: const InputDecoration(
                          labelText: "Note",
                          prefixIcon: Icon(Icons.note),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // -- Form Submit Button
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.3,
                      //   height: 50,
                      //   child: ElevatedButton(
                      //     onPressed: () => transactionController.submitTransactionUpdate(),
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: primaryColor,
                      //         side: BorderSide.none,
                      //         shape: const StadiumBorder()),
                      //     child: const Text("Update",
                      //         style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold)
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

