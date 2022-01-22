import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/models/organizer.dart';
import 'package:liquid_bash/models/tournament.dart';
import 'package:liquid_bash/services/game_service.dart';
import 'package:liquid_bash/services/organizer_service.dart';

class TournamentService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  bool _isLoaded = false;

  final List<Tournament> _tournaments = [];
  List<Tournament> getTorunaments() {
    return _tournaments;
  }

  bool getIsLoaded() {
    return _isLoaded;
  }

  Future<void> getTournamentsCollectionFromFirebase() async {
    if (_tournaments.isNotEmpty) return;
    _instance = FirebaseFirestore.instance;

    CollectionReference tournaments = _instance!.collection("tournaments");
    QuerySnapshot querySnapshot = await tournaments.get();
    final allData = List.from(querySnapshot.docs.map((doc) => doc.data()));
    GameService gameService = new GameService();

    for (var element in allData) {
      List<Game> games = [];
      if (element["games"] != null) {
        for (var game in element["games"]) {
          Map gameData = await gameService.fetchGame(game.id);
          Game gamex = Game.fromJson(gameData);
          games.add(gamex);
        }
      }
      OrganizerService organizerService = new OrganizerService();
      Map organizerData =
          await organizerService.fetchOrganizer(element['organizer'].id);
      Tournament tournament =
          Tournament.fromJson(element, organizerData, games);
      if (tournament.status != null &&
          tournament.name != null &&
          tournament.date != null &&
          tournament.img != null) _tournaments.add(tournament);
    }
    _isLoaded = true;
    notifyListeners();
  }
}
