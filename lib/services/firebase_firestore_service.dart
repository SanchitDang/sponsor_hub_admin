import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class FirestoreService {
  Future<List<UserModel>> getUsersData() async {
    final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      QuerySnapshot usersSnapshot = await usersCollection.get();
      List<UserModel> userList = usersSnapshot.docs.map((userDoc) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      }).toList();

      print(userList);
      return userList;
    } catch (e) {
      print('Error fetching users data: $e');
      throw e; // Rethrow the exception for handling in UI or logging
    }
  }

  void updateUserProfile(String userId, name, email, mobile, city) async {
    final CollectionReference _ridersCollection =
        FirebaseFirestore.instance.collection('drivers');

    try {
      // Update the user's profile data in Firestore
      await _ridersCollection.doc(userId).update({
        'name': name,
        'email': email,
        'mobile': mobile,
        'city': city,
      });

      // Display a success message
      Get.snackbar(
        'Success',
        'Profile updated successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Handle errors
      Get.snackbar(
        'Error',
        'Failed to update profile: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
