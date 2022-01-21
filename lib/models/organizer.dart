import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Organizer {
  String name;
  String img;
  String id;

  Organizer({
    required this.id,
    required this.name,
    required this.img,
  });

  factory Organizer.fromJson(Map json) {
    return Organizer(
      id: json['id'],
      name: json['data']['name'],
      img: json['data']['image'],
    );
  }
}
