import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/models/organizer.dart';
import 'package:liquid_bash/services/organizer_service.dart';
import 'package:provider/provider.dart';

class Tournament {
  String id;
  String? name;
  String? img;
  String? status;
  Timestamp? date;
  Organizer? organizer;
  List<Game> games;
  Tournament(
      {this.name,
      required this.id,
      this.img,
      this.status,
      this.date,
      this.organizer,
      required this.games});

  factory Tournament.fromJson(
      Map json, Organizer organizerData, List<Game> games) {
    return Tournament(
      name: json['data']['name'],
      id: json['id'],
      img: json['data']['img'],
      status: json['data']['status'],
      date: json['data']['date'],
      organizer: organizerData,
      games: games,
    );
  }
}
