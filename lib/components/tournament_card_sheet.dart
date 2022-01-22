import 'package:flutter/material.dart';
import 'package:liquid_bash/components/game_row_card.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/models/organizer.dart';
import 'package:liquid_bash/services/tournament_service.dart';
import 'package:provider/provider.dart';

class TournamentCardSheet extends StatefulWidget {
  final String image;
  final String name;
  final String status;
  final Organizer organizer;
  final int index;
  const TournamentCardSheet(
      {Key? key,
      required this.image,
      required this.organizer,
      required this.status,
      required this.index,
      required this.name})
      : super(key: key);

  @override
  State<TournamentCardSheet> createState() => _TournamentCardSheetState();
}

class _TournamentCardSheetState extends State<TournamentCardSheet> {
  late List<Game> games = [];
  @override
  Widget build(BuildContext context) {
    TournamentService torService =
        Provider.of<TournamentService>(context, listen: true);
    if (torService.getIsLoaded() && games.isEmpty) {
      games = torService.getTorunaments()[widget.index].games;
    }
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
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(widget.image),
              ),
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
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  controller: controller,
                  children: [
                    Text('Organizer',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500)),
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
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500)),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: games
                          .asMap()
                          .entries
                          .map((e) => Column(children: [
                                GameRowCard(
                                  icon: e.value.icon,
                                  name: e.value.name,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ]))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/event", arguments: {
                  'img': widget.image,
                  'name': widget.name,
                  'status': widget.status,
                  'index': widget.index,
                });
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
