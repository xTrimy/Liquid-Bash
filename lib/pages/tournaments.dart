import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/components/tournament_card_sheet.dart';
import 'package:liquid_bash/models/tournament.dart';
import 'package:liquid_bash/services/tournament_service.dart';
import 'package:provider/provider.dart';

class TournamentsPage extends StatefulWidget {
  const TournamentsPage({Key? key}) : super(key: key);

  @override
  State<TournamentsPage> createState() => _TournamentsPageState();
}

class _TournamentsPageState extends State<TournamentsPage> {
  @override
  Widget build(BuildContext context) {
    TournamentService torService =
        Provider.of<TournamentService>(context, listen: true);
    Future.delayed(Duration(seconds: 0), () async {
      FirebaseApp app = await Firebase.initializeApp();
      torService.getTournamentsCollectionFromFirebase().then((value) {});
    });
    List<Tournament> tournaments = torService.getTorunaments();
    final double _width = MediaQuery.of(context).size.width;
    if (!torService.getIsLoaded()) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 2,
                  child: const CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
                Image.asset(
                  "assets/logo.png",
                  width: 50,
                  height: 50,
                )
              ],
            )
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: (tournaments.length / 2).round().toInt(),
        itemBuilder: (context, index) {
          int half = (tournaments.length / 2).round().toInt();
          // ignore: avoid_print
          print(tournaments.length);
          print(tournaments);
          print(index);
          print(half + index);
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TournamentCard(
                    title: tournaments[index].name!,
                    image: tournaments[index].img!,
                    status: tournaments[index].status!,
                  ),
                  (tournaments.length > half + index)
                      ? TournamentCard(
                          title: tournaments[half + index].name!,
                          image: tournaments[half + index].img!,
                          status: tournaments[half + index].status!,
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

class TournamentCard extends StatelessWidget {
  final String title;
  final String image;
  final String status;
  const TournamentCard({
    Key? key,
    required this.title,
    required this.image,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    Map colors = {
      "green": Color(0xFF00FE8A),
      "red": Color(0xFFFF3A3A),
      "blue": Color(0xFF1DE0FF),
      "yellow": Color(0xFFFFC400),
      "white": Color(0xFFFFFFFF),
    };
    Color card_accent = Color(0xFFFFFFFF);
    switch (status) {
      case "Closed":
        card_accent = colors['red'];
        break;
      case "Open":
        card_accent = colors['green'];
        break;
      case "Pending":
        card_accent = colors['yellow'];
        break;
      case "Soon":
        card_accent = colors['blue'];
        break;
      default:
        card_accent = colors["white"];
    }
    return Card(
      shape: RoundedRectangleBorder(
          side: new BorderSide(color: card_accent),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onLongPress: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            // enableDrag: false,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return TournamentCardSheet();
            }),
        onTap: () => Navigator.pushNamed(context, "/event"),
        child: SizedBox(
          width: _width * 0.5 - 25,
          child: Column(
            children: [
              Image.network(
                image,
                width: double.infinity,
                height: 100.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "25 Nov, 2021",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Stack(
                            children: [
                              Container(
                                transform:
                                    Matrix4.translationValues(20.0, 0.0, 0.0),
                                width: 16,
                                height: 16,
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  child: Image.asset(
                                    "assets/logos/lol.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(10.0, 0.0, 0.0),
                                width: 16,
                                height: 16,
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  child: Image.asset(
                                    "assets/logos/fortnite-f.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, 0.0, 0.0),
                                width: 16,
                                height: 16,
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  child: Image.asset(
                                    "assets/logos/valorant-logo.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: Text(
                          "+3 More",
                          style: TextStyle(fontSize: 12),
                        ))
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(12)),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                        color: card_accent,
                        child: Text(status,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
