import 'package:flutter/material.dart';
import 'package:liquid_bash/components/game_row_card.dart';
import 'package:liquid_bash/models/organizer.dart';

class TournamentCardSheet extends StatefulWidget {
  final String image;
  final String name;
  final String status;
  final Organizer organizer;
  const TournamentCardSheet(
      {Key? key,
      required this.image,
      required this.organizer,
      required this.status,
      required this.name})
      : super(key: key);

  @override
  State<TournamentCardSheet> createState() => _TournamentCardSheetState();
}

class _TournamentCardSheetState extends State<TournamentCardSheet> {
  @override
  Widget build(BuildContext context) {
    Map colors = {
      "green": const Color(0xFF00FE8A),
      "red": const Color(0xFFFF3A3A),
      "blue": const Color(0xFF1DE0FF),
      "yellow": const Color(0xFFFFC400),
      "white": const Color(0xFFFFFFFF),
    };
    Color cardAccent = const Color(0xFFFFFFFF);
    switch (widget.status) {
      case "Closed":
        cardAccent = colors['red'];
        break;
      case "Open":
        cardAccent = colors['green'];
        break;
      case "Pending":
        cardAccent = colors['yellow'];
        break;
      case "Soon":
        cardAccent = colors['blue'];
        break;
      default:
        cardAccent = colors["white"];
    }
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
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.network(widget.image),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "25 Nov, 2021",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Container(
                      child: Text(
                        widget.status,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 4),
                      color: cardAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  Text('Organizer',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  const SizedBox(
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
                                  const BorderRadius.all(Radius.circular(20)),
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.network(widget.organizer.img)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(widget.organizer.name)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Tournament Games',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  const SizedBox(
                    height: 5,
                  ),
                  const GameRowCard(),
                  const SizedBox(
                    height: 5,
                  ),
                  const GameRowCard(),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/event");
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40)),
              ),
              child: Text('VIEW DETAILS'),
            )
          ]),
        ),
      ),
    );
  }
}
