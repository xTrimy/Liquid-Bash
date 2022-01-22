import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_bash/models/tournament.dart';
import 'package:liquid_bash/pages/tournaments.dart';
import 'package:liquid_bash/services/DataController.dart';
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
  @override
  Widget build(BuildContext context) {
    TournamentService torService =
        Provider.of<TournamentService>(context, listen: true);
    Future.delayed(Duration(seconds: 1), () async {
      torService.getTournamentsCollectionFromFirebase().then((value) {});
    });
    List<Tournament> tournaments = torService.getTorunaments();
    Widget searchedData() {
      return ListView.builder(
        itemCount: (tournaments.length / 2).round().toInt(),
        itemBuilder: (context, index) {
          int half = (tournaments.length / 2).round().toInt();
          return GestureDetector(
            onTap: () {
              // Get.to(TournamentsPage(),transition: Transition.downToUp,arguments: tournaments[index]);
              Navigator.pushNamed(context, "/event", arguments: {
          'img': tournaments[index].img!,
          'name': tournaments[index].name!,
          'status': tournaments[index].status,
        });
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(tournaments[index].img!),
              ),
              title: Text(
                tournaments[index].name!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
              subtitle: Text(
                tournaments[index].status!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          );
        },
      );
    }

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
                      val.queryData(searchController.text).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExcecuted = true;
                        });
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
          ? searchedData()
          : Container(
              child: Center(
              child: Text('Search any Tournemnts',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
            )),
    );
  }
}
