import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:liquid_bash/models/tournament.dart';

class TournamentService {
  FirebaseFirestore? _instance;

  List<Tournament> _tournaments = [];
  List<Tournament> getTorunaments() {
    return _tournaments;
  }

  Future<void> getTournamentsCollectionFromFirebase() async {
    if (_tournaments.length > 0) return;
    _instance = FirebaseFirestore.instance;

    CollectionReference tournaments = _instance!.collection("tournaments");
    QuerySnapshot querySnapshot = await tournaments.get();
    final allData = List.from(querySnapshot.docs.map((doc) => doc.data()));
    allData.forEach((element) {
      Tournament tournament = Tournament.fromJson(element);
      _tournaments.add(tournament);
    });
  }
}
