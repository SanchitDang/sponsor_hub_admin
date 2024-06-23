import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String? transactionId;
  final String? address;
  final String? email;
  final String? name;
  final String? note;
  final String? phoneNumber;
  final String? sponsorshipType;
  final Timestamp? timestamp;
  final String? userId;

  TransactionModel({
    required this.transactionId,
    required this.address,
    required this.email,
    required this.name,
    required this.note,
    required this.phoneNumber,
    required this.sponsorshipType,
    required this.timestamp,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'transactionId': transactionId,
      'address': address,
      'email': email,
      'name': name,
      'note': note,
      'phoneNumber': phoneNumber,
      'sponsorshipType': sponsorshipType,
      'timestamp': timestamp,
      'userId': userId,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId: map['transactionId'],
      address: map['address'],
      email: map['email'],
      name: map['name'],
      note: map['note'],
      phoneNumber: map['phoneNumber'],
      sponsorshipType: map['sponsorshipType'],
      timestamp: map['timestamp'],
      userId: map['userId'],
    );
  }
}
