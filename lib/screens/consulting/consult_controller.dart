import 'package:admin/services/firebase_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/consult_model.dart';

class ConsultController extends GetxController {
  final RxString consultId = ''.obs;
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

  // Method to update consult data
  void updateConsultData({
    required String address,
    required String email,
    required String name,
    required String note,
    required String phoneNumber,
    required String sponsorshipType,
    required String userId,
    required Timestamp timestamp,
  }) {
    addressController.text = address;
    emailController.text = email;
    nameController.text = name;
    noteController.text = note;
    phoneNumberController.text = phoneNumber;
    sponsorshipTypeController.text = sponsorshipType;
    userIdController.text = userId;
    this.timestamp.value = timestamp;
  }

  // Method to submit consult update
  void submitConsultUpdate() async {
    try {
      final data = {
        'address': addressController.text,
        'email': emailController.text,
        'name': nameController.text,
        'note': noteController.text,
        'phoneNumber': phoneNumberController.text,
        'sponsorshipType': sponsorshipTypeController.text,
        'userId': userIdController.text,
        'timestamp': timestamp.value!,
      };
      await FirestoreService().updateConsult(consultId.value, data);
      Get.snackbar('Success', 'Consult updated successfully!', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', 'Failed to update consult: $e', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // Method to delete the consult
  void deleteConsult() {
    // Add logic here to delete the consult
  }

  // Method to set data from ConsultModel to respective TextEditingController
  void setDataFromConsultModel(ConsultModel consultModel) {
    consultId.value = consultModel.userId ?? "";
    addressController.text = consultModel.address ?? "";
    emailController.text = consultModel.email ?? "";
    nameController.text = consultModel.name ?? "";
    noteController.text = consultModel.note ?? "";
    phoneNumberController.text = consultModel.phoneNumber ?? "";
    sponsorshipTypeController.text = consultModel.sponsorshipType ?? "";
    userIdController.text = consultModel.userId ?? "";
    timestamp.value = consultModel.timestamp;
  }
}
