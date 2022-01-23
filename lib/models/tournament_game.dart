import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/models/organizer.dart';
import 'package:liquid_bash/models/tournament.dart';
import 'package:liquid_bash/services/organizer_service.dart';
import 'package:provider/provider.dart';

class TournamentGame {
  String id;
  Tournament tournament;
  Game game;
  TournamentGame({
    required this.id,
    required this.tournament,
    required this.game,
  });

  factory TournamentGame.fromJson(Map json, Tournament tournament, Game game) {
    return TournamentGame(
      id: json['id'],
      tournament: tournament,
      game: game,
    );
  }
}
