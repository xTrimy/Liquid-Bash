import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_bash/models/user.dart';

class UserService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  bool _isLoggedInBefore = false;
  User? _currentUser = FirebaseAuth.instance.currentUser;

  final List<Userr> _tournaments = [];
  List<Userr> getTorunaments() {
    return _tournaments;
  }

  bool getIsLoggedInBefore() {
    return _isLoggedInBefore;
  }

  User? getCurrentUser() {
    return _currentUser ?? null;
  }

  void updateUser() {
    _currentUser = FirebaseAuth.instance.currentUser;
  }
}
