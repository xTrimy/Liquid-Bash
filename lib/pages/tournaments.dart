import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TournamentCard(),
              TournamentCard(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TournamentCard(),
              TournamentCard(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TournamentCard(),
              TournamentCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class TournamentCard extends StatelessWidget {
  const TournamentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, "/event"),
        child: SizedBox(
          width: _width * 0.5 - 30,
          child: Column(
            children: [
              Image.asset(
                "assets/valorant.jpg",
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
                        "Gamers Lounge Summer Cup V",
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
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                        color: Color.fromRGBO(0, 255, 136, 1),
                        child: Text("Open",
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
