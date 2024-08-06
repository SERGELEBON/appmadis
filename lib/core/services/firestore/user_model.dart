import 'package:cloud_firestore/cloud_firestore.dart';

class UserM {
  final String name;
  final DateTime dob;
  final String idType;
  final String idNumber;
  final String password;

  UserM({
    required this.name,
    required this.dob,
    required this.idType,
    required this.idNumber,
    required this.password,
  });

  factory UserM.fromMap(Map<String, dynamic> map) {
    return UserM(
      name: map['name'],
      dob: (map['dob'] as Timestamp).toDate(),
      idType: map['idType'],
      idNumber: map['idNumber'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dob': Timestamp.fromDate(dob),
      'idType': idType,
      'idNumber': idNumber,
      'password': password,
    };
  }
}
