import 'package:flutter/material.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/services/tournament_service.dart';
import 'package:provider/provider.dart';

class TournamentRegister extends StatefulWidget {
  const TournamentRegister({Key? key}) : super(key: key);

  @override
  State<TournamentRegister> createState() => _TournamentRegisterState();
}

class _TournamentRegisterState extends State<TournamentRegister> {
  Widget _buildcontainer(
      {IconData? icon,
      required String img,
      required String name,
      required String tournamentName,
      required String gameId,
      required String tournamentId,
      required BuildContext context}) {
    TournamentService torService =
        Provider.of<TournamentService>(context, listen: true);

    return Card(
      child: InkWell(
        onTap: () => {
          Future.delayed(Duration(seconds: 0), () async {
            return torService.register_user_to_tournament(
                tournament_id: tournamentId, game_id: gameId);
          }).then((value) {
            if (value == 0) {
              Navigator.pushNamed(context, '/response', arguments: {
                "status": "success",
                "message": "You have successfully registered in " +
                    tournamentName +
                    " \"" +
                    name +
                    "\" tournament",
              });
            } else if (value == 1) {
              Navigator.pushNamed(context, '/response', arguments: {
                "status": "error",
                "message": "You must login first",
              });
            } else if (value == 2) {
              Navigator.pushNamed(context, '/response', arguments: {
                "status": "error",
                "message": "You're already registered in this tournament",
              });
            }
          })
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Container(
                          child: Image.network(img,
                              width: double.infinity, height: double.infinity),
                          width: 60,
                          height: 60),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  late List<Game> games = [];
  late String id;

  @override
  Widget build(BuildContext context) {
    Map eventData = ModalRoute.of(context)!.settings.arguments as Map;
    TournamentService torService =
        Provider.of<TournamentService>(context, listen: true);
    if (torService.getIsLoaded() && games.isEmpty) {
      games = torService.getTorunaments()[eventData["index"]].games;
      id = torService.getTorunaments()[eventData["index"]].id;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          eventData["name"],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: GridView.count(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              children: games
                  .asMap()
                  .entries
                  .map(
                    (e) => _buildcontainer(
                        context: context,
                        img: e.value.icon,
                        icon: Icons.person,
                        name: e.value.name,
                        tournamentName: eventData["name"],
                        tournamentId: id,
                        gameId: e.value.id),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
