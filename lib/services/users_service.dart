import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/models/user.dart';

class UserService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  bool _isLoggedInBefore = false;
  bool _isGamesLoaded = false;
  List<Game> games = [];
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
  

  List<Game> getUserGames() {
    return games;
  }

  bool isUserGamesLoaded() {
    return _isGamesLoaded;
  }

  void updateUser() {
    _currentUser = FirebaseAuth.instance.currentUser;
  }
}
