import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.color = null,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}
