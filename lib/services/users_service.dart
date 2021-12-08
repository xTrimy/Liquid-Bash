import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_bash/models/user.dart';

class UserService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  bool _isLoggedInBefore = false;

  final List<Userr> _tournaments = [];
  List<Userr> getTorunaments() {
    return _tournaments;
  }

  bool getIsLoggedInBefore() {
    return _isLoggedInBefore;
  }
}
