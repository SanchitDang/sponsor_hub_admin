import 'package:admin/services/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class UserProfileController extends GetxController {
  final RxString profileUrl = ''.obs;
  final RxString userId = ''.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController followersController = TextEditingController();
  final TextEditingController viewsController = TextEditingController();
  final TextEditingController socialMediaLinkController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final RxBool obscurePassword = true.obs;

  @override
  void onClose() {
    // Dispose the TextEditingController when the controller is closed to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    typeController.dispose();
    ageController.dispose();
    locationController.dispose();
    followersController.dispose();
    viewsController.dispose();
    socialMediaLinkController.dispose();
    aboutController.dispose();
    super.onClose();
  }

  // Method to update profile data
  void updateProfileData({
    required String name,
    required String email,
    required String type,
    required String age,
    required String location,
    required String followers,
    required String views,
    required String socialMediaLink,
    required String about,
  }) {
    nameController.text = name;
    emailController.text = email;
    typeController.text = type;
    ageController.text = age;
    locationController.text = location;
    followersController.text = followers;
    viewsController.text = views;
    socialMediaLinkController.text = socialMediaLink;
    aboutController.text = about;
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void submitProfileUpdate() async {
    FirestoreService().updateUserProfile(
      userId.value,
      {
        'name': nameController.text,
        'email': emailController.text,
        'type': typeController.text,
        'age': ageController.text,
        'location': locationController.text,
        'followers': followersController.text,
        'views': viewsController.text,
        'socialMediaLink': socialMediaLinkController.text,
        'about': aboutController.text,
        'profilePic': profileUrl.value,
      },
    );
  }

  // Method to delete the profile
  void deleteProfile() {
    // Add logic here to delete the profile
  }

  // Method to set data from userData to respective TextEditingController
  void setDataFromUserModel(UserModel userModel) {
    profileUrl.value = userModel.profilePic ?? "";
    userId.value = userModel.id ?? "";
    nameController.text = userModel.name ?? "";
    emailController.text = userModel.email ?? "";
    typeController.text = userModel.type ?? "";
    ageController.text = userModel.age ?? "";
    locationController.text = userModel.location ?? "";
    followersController.text = userModel.followers ?? "";
    viewsController.text = userModel.views ?? "";
    socialMediaLinkController.text = userModel.socialMediaLink ?? "";
    aboutController.text = userModel.about ?? "";
  }
}

