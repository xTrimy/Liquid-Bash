import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Tournament {
  String? name;
  String? img;
  String? status;
  Timestamp? date;

  Tournament({
    this.name,
    this.img,
    this.status,
    this.date,
  });

  factory Tournament.fromJson(Map json) {
    return Tournament(
      name: json['name'],
      img: json['img'],
      status: json['status'],
      date: json['date'],
    );
  }
}
