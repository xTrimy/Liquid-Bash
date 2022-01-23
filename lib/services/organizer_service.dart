import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_bash/models/game.dart';

class OrganizerService extends ChangeNotifier {
  FirebaseFirestore? _instance;

  Future<Map> fetchOrganizer(String id) async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('organizers').doc(id).get();
    Map data = {'data': querySnapshot.data(), 'id': querySnapshot.id};
    return data;
  }
}
