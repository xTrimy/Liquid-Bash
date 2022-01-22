import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:liquid_bash/models/organizer.dart';
import 'package:liquid_bash/services/organizer_service.dart';
import 'package:provider/provider.dart';

class Tournament {
  String? name;
  String? img;
  String? status;
  Timestamp? date;
  Organizer? organizer;
  Tournament({this.name, this.img, this.status, this.date, this.organizer});

  factory Tournament.fromJson(Map json, Map organizerData) {
    return Tournament(
      name: json['name'],
      img: json['img'],
      status: json['status'],
      date: json['date'],
      organizer: Organizer.fromJson(organizerData),
    );
  }
}
