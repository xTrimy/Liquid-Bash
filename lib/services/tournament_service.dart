import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final allData = List.from(
        querySnapshot.docs.map((doc) => {'data': doc.data(), 'id': doc.id}));
    GameService gameService = GameService();

    for (var element in allData) {
      List<Game> games = [];
      if (element['data']["games"] != null) {
        for (var game in element['data']["games"]) {
          Map gameData = await gameService.fetchGame(game.id);
          Game gamex = Game.fromJson(gameData);
          games.add(gamex);
        }
      }
      OrganizerService organizerService = new OrganizerService();
      Map organizerData = await organizerService
          .fetchOrganizer(element['data']['organizer'].id);

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

  Future<int> register_user_to_tournament(
      {required String tournament_id, required String game_id}) async {
    if (FirebaseAuth.instance.currentUser != null) {
      _instance = FirebaseFirestore.instance;
      var checkRegistrationExists = _instance!
          .collection("tournament_game_user")
          .where('game', isEqualTo: 'games/' + game_id)
          .where('user_id',
              isEqualTo:
                  'users/' + FirebaseAuth.instance.currentUser!.uid.toString())
          .where('tournament', isEqualTo: 'tournaments/' + tournament_id);
      var doc = await checkRegistrationExists.get();
      if (doc.docs.isEmpty) {
        _instance!.collection('tournament_game_user').add({
          'user_id': 'users/' + FirebaseAuth.instance.currentUser!.uid,
          'game': 'games/' + game_id,
          'tournament': 'tournaments/' + tournament_id
        });
        return 0;
      } else {
        return 2;
      }
    } else {
      return 1;
    }
  }
}
