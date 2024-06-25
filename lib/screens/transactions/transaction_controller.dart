import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/transaction_model.dart';
import '../../services/firebase_firestore_service.dart';

class TransactionController extends GetxController {
  final RxString transactionId = ''.obs;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController sponsorshipTypeController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final Rx<Timestamp?> timestamp = Rx<Timestamp?>(null);

  @override
  void onClose() {
    // Dispose the TextEditingController when the controller is closed to prevent memory leaks
    addressController.dispose();
    emailController.dispose();
    nameController.dispose();
    noteController.dispose();
    phoneNumberController.dispose();
    sponsorshipTypeController.dispose();
    userIdController.dispose();
    super.onClose();
  }

  void submitTransactionUpdate() async {
    try {
      final data = {
        'transactionId': transactionId.value,
        'address': addressController.text,
        'email': emailController.text,
        'name': nameController.text,
        'note': noteController.text,
        'phoneNumber': phoneNumberController.text,
        'sponsorshipType': sponsorshipTypeController.text,
        'userId': userIdController.text,
        'timestamp': timestamp.value!,
      };
      await FirestoreService().updateTransaction(transactionId.value, data);
      Get.snackbar('Success', 'Transaction updated successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', 'Failed to update transaction: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void addTransaction() async {
    try {
      final data = {
        'address': addressController.text,
        'email': emailController.text,
        'name': nameController.text,
        'note': noteController.text,
        'phoneNumber': phoneNumberController.text,
        'sponsorshipType': sponsorshipTypeController.text,
        'userId': "userIdController.value",
        'transactionId': DateTime.now().microsecondsSinceEpoch.toString(),
        'timestamp': Timestamp.now(),
      };

      await FirestoreService().addTransaction(data);

      Get.snackbar(
        'Success',
        'Transaction added successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add transaction: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void setDataFromTransactionModel(TransactionModel transactionModel) {
    transactionId.value = transactionModel.transactionId ?? "";
    addressController.text = transactionModel.address ?? "";
    emailController.text = transactionModel.email ?? "";
    nameController.text = transactionModel.name ?? "";
    noteController.text = transactionModel.note ?? "";
    phoneNumberController.text = transactionModel.phoneNumber ?? "";
    sponsorshipTypeController.text = transactionModel.sponsorshipType ?? "";
    userIdController.text = transactionModel.userId ?? "";
    timestamp.value = transactionModel.timestamp;
  }
}
