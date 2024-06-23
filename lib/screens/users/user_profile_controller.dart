import 'package:admin/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class UserProfileController extends GetxController {
  final RxString profileUrl = ''.obs;
  final RxString riderId = ''.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController socialMediaLinkController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final RxBool obscurePassword = true.obs;

  @override
  void onClose() {
    // Dispose the TextEditingController when the controller is closed to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    socialMediaLinkController.dispose();
    cityController.dispose();
    super.onClose();
  }

  // Method to update profile data
  void updateProfileData({
    required String name,
    required String email,
    required String mobile,
    required String city,
  }) {
    nameController.text = name;
    emailController.text = email;
    socialMediaLinkController.text = mobile;
    cityController.text = city;
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void submitProfileUpdate() async {
    FirestoreService().updateUserProfile(
      riderId.value,
      nameController.text,
      emailController.text,
      socialMediaLinkController.text,
      cityController.text,
    );
  }

  // Method to delete the profile
  void deleteProfile() {
    // Add logic here to delete the profile
  }

  // Method to set data from userData to respective TextEditingController
  void setDataFromUserModel(UserModel userModel) {
    profileUrl.value = userModel.profilePic ?? "";
    riderId.value = userModel.id ?? "";
    nameController.text = userModel.name ?? "";
    emailController.text = userModel.email ?? "";
    socialMediaLinkController.text = userModel.socialMediaLink ?? "";
    cityController.text = userModel.location ?? "";
  }
}
