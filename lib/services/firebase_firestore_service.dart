import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class FirestoreService {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<List<UserModel>> getUsersData(String fieldName, dynamic fieldValue) async {
    try {
      QuerySnapshot usersSnapshot = await usersCollection.where(fieldName, isEqualTo: fieldValue).get();
      List<UserModel> userList = usersSnapshot.docs.map((userDoc) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      }).toList();

      print(userList);
      return userList;
    } catch (e) {
      print('Error fetching users data: $e');
      throw e;
    }
  }

  Future<List<UserModel>> getRecentUsers(int limit) async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.limit(limit).get();
      return querySnapshot.docs.map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Error fetching recent users: $e');
      throw e;
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
