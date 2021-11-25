import 'package:flutter/material.dart';
import 'package:liquid_bash/components/game_row_card.dart';

class TournamentCardSheet extends StatelessWidget {
  const TournamentCardSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.7,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.grey.shade900,
        child: Container(
          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset("assets/valorant.jpg"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "25 Nov, 2021",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Gamers Lounge Summer Cup V",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Container(
                      child: Text(
                        "Open",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  Text('Organizer',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.grey.shade900,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                      "assets/logos/gamers_lounge.jpg")),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Gamers Lounge")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Tournament Games',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  SizedBox(
                    height: 5,
                  ),
                  GameRowCard(),
                  SizedBox(
                    height: 5,
                  ),
                  GameRowCard(),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, "/event");
              },
              color: Theme.of(context).accentColor,
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text('VIEW DETAILS'),
            )
          ]),
        ),
      ),
    );
  }
}
