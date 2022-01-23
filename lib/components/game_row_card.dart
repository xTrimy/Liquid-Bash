import 'package:flutter/material.dart';

class GameRowCard extends StatelessWidget {
  final String name;
  final String icon;
  const GameRowCard({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: SizedBox(width: 30, height: 30, child: Image.network(icon)),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(name)
      ],
    );
  }
}
