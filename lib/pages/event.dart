import 'package:flutter/material.dart';
import 'package:liquid_bash/components/styles.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/valorant.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                height: 250,
                width: double.infinity,
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Valorant\nTournament Is Here",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Valorant | May 17, 2020",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: Styles.buttonStyle,
                        child: const Text("Register"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                      )
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
