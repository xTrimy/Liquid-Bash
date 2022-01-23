import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_bash/models/tournament.dart';
import 'package:liquid_bash/services/data_controller.dart';
import 'package:liquid_bash/services/tournament_service.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;
  bool isExcecuted = false;
  List<Tournament> searched_tournaments = [];
  @override
  Widget build(BuildContext context) {
    TournamentService torService =
        Provider.of<TournamentService>(context, listen: true);
    Future.delayed(Duration(seconds: 0), () async {
      torService.getTournamentsCollectionFromFirebase().then((value) {});
    });
    List<Tournament> tournaments = torService.getTorunaments();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            isExcecuted = false;
          });
        },
      ),
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        searched_tournaments = [];
                        for (var element in tournaments) {
                          if (element.name!
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            print(element);
                            searched_tournaments.add(element);
                          }
                        }
                        isExcecuted = true;
                      });
                    });
              })
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search Tournements',
              hintStyle: TextStyle(color: Colors.white)),
          controller: searchController,
        ),
      ),
      body: isExcecuted
          ? Column(
              children: searched_tournaments.asMap().entries.map((e) {
                return GestureDetector(
                  onTap: () {
                    // Get.to(TournamentsPage(),transition: Transition.downToUp,arguments: tournaments[index]);
                    Navigator.pushNamed(context, "/event", arguments: {
                      'img': searched_tournaments[e.key].img!,
                      'name': searched_tournaments[e.key].name!,
                      'status': searched_tournaments[e.key].status,
                      'index': tournaments.indexOf(searched_tournaments[e.key]),
                    });
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(searched_tournaments[e.key].img!),
                    ),
                    title: Text(
                      searched_tournaments[e.key].name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                    subtitle: Text(
                      searched_tournaments[e.key].status!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                );
              }).toList(),
            )
          : Container(
              child: Center(
              child: Text('Search any Tournemnts',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
            )),
    );
  }
}
