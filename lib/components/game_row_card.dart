import 'package:flutter/material.dart';

class GameRowCard extends StatelessWidget {
  const GameRowCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset("assets/logos/lol.jpg")),
        ),
        SizedBox(
          width: 10,
        ),
        Text("League Of Legends")
      ],
    );
  }
}
