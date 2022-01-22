import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_bash/models/game.dart';

class GameService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  bool _isLoaded = false;

  final List<Game> _games = [];
  List<Game> getGames() {
    return _games;
  }

  bool getIsLoaded() {
    return _isLoaded;
  }

  Future<void> getGamedCollectionFromDatabase() async {
    if (_games.isNotEmpty || _isLoaded) return;
    _instance = FirebaseFirestore.instance;

    CollectionReference tournaments = _instance!.collection("games");
    QuerySnapshot querySnapshot = await tournaments.get();
    final allData = List.from(
        querySnapshot.docs.map((doc) => {'data': doc.data(), 'id': doc.id}));
    for (var element in allData) {
      Game game = Game.fromJson(element);
      if (game.name != null && game.img != null) _games.add(game);
      _isLoaded = true;
      notifyListeners();
    }
  }

  Future<Map> fetchGame(String id) async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('games').doc(id).get();
    Map data = {'data': querySnapshot.data(), 'id': querySnapshot.id};
    notifyListeners();
    return data;
  }
}
