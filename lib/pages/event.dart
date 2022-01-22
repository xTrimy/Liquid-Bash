import 'package:flutter/material.dart';
import 'package:liquid_bash/components/game_row_card.dart';
import 'package:liquid_bash/components/styles.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/services/tournament_service.dart';
import 'package:provider/provider.dart';

class EventPage extends StatefulWidget {
  EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    final Map eventData = ModalRoute.of(context)!.settings.arguments as Map;
    ScrollController scrollController = ScrollController();
    return Scaffold(
      //1
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          //2
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                eventData["img"],
                fit: BoxFit.fill,
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return EventDetails(
                  scrollController: scrollController,
                  eventData: eventData,
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetails extends StatefulWidget {
  final Map eventData;
  final ScrollController scrollController;
  const EventDetails(
      {Key? key, required this.scrollController, required this.eventData})
      : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late List<Game> games = [];

  @override
  Widget build(BuildContext context) {
    TournamentService torService =
        Provider.of<TournamentService>(context, listen: true);
    if (torService.getIsLoaded() && games.isEmpty) {
      games = torService.getTorunaments()[widget.eventData["index"]].games;
    }
    const edgeInsets = EdgeInsets.symmetric(vertical: 10, horizontal: 20);
    return ListView(
      controller: widget.scrollController,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("25 Nov, 2021"),
                const SizedBox(
                  width: 2,
                ),
                Row(
                  children: [
                    Text(
                      widget.eventData["name"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Organizer",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            "assets/logos/gamers_lounge.jpg",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Gamers Lounge",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Tournament Games",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: games
                      .asMap()
                      .entries
                      .map((e) => Column(children: [
                            GameRowCard(name: e.value.name, icon: e.value.icon),
                            SizedBox(
                              height: 5,
                            ),
                          ]))
                      .toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Awards",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            "assets/logos/fortnite-f.png",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Prizepool: 500",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
        ),
        Stack(
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/tournament_register",
                      arguments: {
                        "name": widget.eventData["name"],
                        "index": widget.eventData["index"]
                      });
                },
                child: const Text(
                  "Register Now",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: edgeInsets,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
