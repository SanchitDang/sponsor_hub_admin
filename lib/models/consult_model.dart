import 'package:cloud_firestore/cloud_firestore.dart';

class ConsultModel {
  final String? address;
  final String? email;
  final String? name;
  final String? note;
  final String? phoneNumber;
  final String? sponsorshipType;
  final Timestamp? timestamp;
  final String? userId;

  ConsultModel({
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

  factory ConsultModel.fromMap(Map<String, dynamic> map) {
    return ConsultModel(
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
