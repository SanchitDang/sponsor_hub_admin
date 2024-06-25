import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/consult_model.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';

class FirestoreService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference consultCollection =
      FirebaseFirestore.instance.collection('consult');
  final CollectionReference transactionCollection =
  FirebaseFirestore.instance.collection('transactions');

  Future<List<UserModel>> getUsersData(
      String fieldName, dynamic fieldValue) async {
    try {
      QuerySnapshot usersSnapshot =
          await usersCollection.where(fieldName, isEqualTo: fieldValue).get();
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
      return querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching recent users: $e');
      throw e;
    }
  }

  Future<void> updateUserProfile(String userId, Map<String, dynamic> data) async {
    try {
      await usersCollection.doc(userId).update(data);
      Get.snackbar(
        'Success',
        'Consult updated successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      print("User profile updated successfully");
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update consult: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error updating user profile: $e");
      throw e;
    }
  }

  Future<void> deleteUserProfile(String userId) async {
    try {
      await usersCollection.doc(userId).delete();
      Get.snackbar(
        'Success',
        'User deleted successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      print("User profile deleted successfully");
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete user: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error deleting user profile: $e");
      throw e;
    }
  }

  Future<List<ConsultModel>> getConsultData() async {
    try {
      QuerySnapshot consultSnapshot = await consultCollection.get();
      List<ConsultModel> consultList = consultSnapshot.docs.map((consultDoc) {
        return ConsultModel.fromMap(consultDoc.data() as Map<String, dynamic>);
      }).toList();

      return consultList;
    } catch (e) {
      print('Error fetching consult data: $e');
      throw e;
    }
  }

  Future<void> updateConsult(String consultId, Map<String, dynamic> data) async {
    try {
      await consultCollection.doc(consultId).update(data);
      Get.snackbar(
        'Success',
        'Consult updated successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      print("Consult updated successfully");
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update consult: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error updating consult: $e");
      throw e;
    }
  }

  Future<void> addTransaction(Map<String, dynamic> data) async {
    try {
      await transactionCollection.add(data);
      print("Transaction added successfully");
    } catch (e) {
      print("Error adding transaction: $e");
      throw e;
    }
  }

  Future<List<TransactionModel>> getTransactionsData() async {
    try {
      QuerySnapshot transactionSnapshot = await transactionCollection.get();
      List<TransactionModel> transactionList = transactionSnapshot.docs.map((transactionDoc) {
        return TransactionModel.fromMap(transactionDoc.data() as Map<String, dynamic>);
      }).toList();

      return transactionList;
    } catch (e) {
      print('Error fetching transaction data: $e');
      throw e;
    }
  }

  Future<void> updateTransaction(String transactionId, Map<String, dynamic> data) async {
    try {
      await transactionCollection.doc(transactionId).update(data);
      print("Transaction updated successfully");
    } catch (e) {
      print("Error updating transaction: $e");
      throw e;
    }
  }
}
