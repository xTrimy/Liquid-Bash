import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/models/tournament.dart';
import 'package:liquid_bash/models/tournament_game.dart';
import 'package:liquid_bash/models/user.dart';
import 'package:liquid_bash/services/tournament_service.dart';

class UserService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  bool _isLoggedInBefore = false;
  bool _isGamesLoaded = false;
  List<Game> games = [];
  List<TournamentGame> _tournamentGames = [];
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

  Future<void> loadUserGames() async {
    if (games.isNotEmpty) return;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('game_user')
        .limit(10)
        .where('user', isEqualTo: '/users/' + _currentUser!.uid)
        .get();
    List<String> game_ids = [];
    for (var doc in querySnapshot.docs) {
      game_ids.add(doc.get('game').toString().split('/')[2]);
    }
    game_ids = game_ids.toSet().toList();
    for (var game in game_ids) {
      var gameData =
          await FirebaseFirestore.instance.collection('games').doc(game).get();
      var data = {'id': gameData.id, 'data': gameData.data()};
      if (data != null) {
        Game g = Game.fromJson(data);
        games.add(g);
      }
    }
    notifyListeners();
    _isGamesLoaded = true;
  }

  Future<void> loadTournamentGames() async {
    if (_tournamentGames.isNotEmpty) return;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('tournament_game_user')
        .where('user_id', isEqualTo: 'users/' + _currentUser!.uid)
        .get();
    final allData = List.from(
        querySnapshot.docs.map((doc) => {'data': doc.data(), 'id': doc.id}));
    print("allData " + allData.toString());
    for (var element in allData) {
      print(element['data']['game'].id);
      var gameSnapShot = await FirebaseFirestore.instance
          .collection('games')
          .doc(element['data']['game'].id)
          .get();
      Map gameData = {'data': gameSnapShot.data(), 'id': gameSnapShot.id};
      Game game = Game.fromJson(gameData);

      Tournament tournament = await TournamentService()
          .getTournament(id: element['data']['tournament'].id);
      TournamentGame tournament_game =
          TournamentGame.fromJson(element, tournament, game);
      _tournamentGames.add(tournament_game);
    }
    notifyListeners();
  }

  List<Game> getUserGames() {
    return games;
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
        var x = _instance!.collection('tournament_game_user').add({
          'user_id': 'users/' + FirebaseAuth.instance.currentUser!.uid,
          'game': _instance!.collection('games').doc(game_id),
          'tournament': _instance!.collection('tournaments').doc(tournament_id)
        });
        var document_element = await x;
        var gameSnapShot = await FirebaseFirestore.instance
            .collection('games')
            .doc(game_id)
            .get();
        Map gameData = {'data': gameSnapShot.data(), 'id': gameSnapShot.id};
        Game game = Game.fromJson(gameData);
        Tournament tournament =
            await TournamentService().getTournament(id: tournament_id);
        TournamentGame tournament_game = TournamentGame.fromJson(
            {'id': document_element.id}, tournament, game);
        _tournamentGames.add(tournament_game);
        notifyListeners();
        return 0;
      } else {
        return 2;
      }
    } else {
      return 1;
    }
  }

  List<TournamentGame> getUserTournamentGames() {
    return _tournamentGames;
  }

  bool isUserGamesLoaded() {
    return _isGamesLoaded;
  }

  void updateUser() {
    _currentUser = FirebaseAuth.instance.currentUser;
  }
}
