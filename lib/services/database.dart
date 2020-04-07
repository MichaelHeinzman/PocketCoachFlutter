import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final firestore = Firestore.instance;

  void createUser(
      String uid,
      String email,
      String username,
      String fullName,
      int weight,
      String sex,
      String heightFeet,
      String heightInches,
      String goal) async {
    await firestore.collection('User').document(uid).setData({
      'email': email,
      'username': username,
      'fullName': fullName,
      'weight': weight,
      'sex': sex,
      'heightFeet': heightFeet,
      'heightInches': heightInches,
      'goal': goal
    });
  }

  void updateUser(String uid, String field, String value) {
    Firestore.instance
        .collection('User')
        .document(uid)
        .updateData({field: value});
  }

  Future<String> getField(String uid, String field) async {
    DocumentSnapshot querySnapshot =
        await Firestore.instance.collection("User").document(uid).get();
    String username = querySnapshot.data[field].toString();
    return username;
  }
}
