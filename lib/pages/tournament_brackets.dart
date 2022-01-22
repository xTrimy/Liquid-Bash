import 'dart:ffi';

import 'package:flutter/material.dart';

class TournamentBrackets extends StatefulWidget {
  const TournamentBrackets({Key? key}) : super(key: key);

  @override
  _AddTournmentState createState() => _AddTournmentState();
  _NextStepBrackets CreateState() => _NextStepBrackets();
}

class _AddTournmentState extends State<TournamentBrackets> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  int _value = 1;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 32),
      ),
      body: Container(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: InteractiveViewer(
                constrained: false,
                maxScale: 100,
                minScale: 0.5,
                scaleEnabled: true,
                child: Container(
                  color: Colors.grey,
                  width: 5000,
                  height: 5000,
                  child: CustomPaint(
                    size: Size.infinite,
                    foregroundPainter: BracketPainter(y_multiplier: 6),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 400,
              child: ListView(
                children: [
                  Text(
                    'CREATE \nBRACKET',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ).copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/accent.png',
                    width: 99,
                    height: 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    child: Text("BASICS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Select Tournament',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      hintStyle: TextStyle(fontSize: 12.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Bracket Name',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      hintStyle: TextStyle(fontSize: 12.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    child: Text("BRACKET",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Select Bracket Size',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 255, 136)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Bracket of 8"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Bracket of 16"),
                                value: 2,
                              )
                            ],
                            onChanged: (int? value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                            hint: Text("Select item")),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        child: const Text("Next"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => _NextStepBrackets()));
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _NextStepBrackets extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 32),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CREATE \nBRACKET',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ).copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/accent.png',
                  width: 99,
                  height: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  child: Text("BASICS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Select Tournament',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    hintStyle: TextStyle(fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Bracket Name',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    hintStyle: TextStyle(fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Let's Go"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BracketPainter extends CustomPainter {
  double x = 10.0, y = 10.0;
  int compititors = 16;
  double y_multiplier;
  BracketPainter({required this.y_multiplier});
  @override
  void paint(Canvas canvas, Size size) {
    TextPainter painter;
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.greenAccent;
    for (int k = 1, z = 0; k <= compititors; k *= 2, z++) {
      int compititors_in_layer = 0;
      if (k == 0) {
        compititors_in_layer = compititors;
      } else {
        compititors_in_layer = (compititors / k).toInt();
      }
      for (int i = 0; i < compititors_in_layer; i++) {
        int margin = ((5 * i * k)).toInt();
        double spacey = (20 * z * z + (15 + 40 * i * k + margin).toDouble());
        double spaceyi = (20 * z + (15 + 40 * i * k + margin).toDouble());

        double spacex = (10 + (120 + 80) * z).toDouble();
        if (z > 0) {
          canvas.drawLine(
            Offset(
              0 + spacex - 160 / 2,
              0 + spaceyi,
            ),
            Offset(
              30 + spacex - 120 / 2,
              0 + spaceyi,
            ),
            paint,
          );
          canvas.drawLine(
            Offset(
              x * 13,
              32 * 2.5,
            ),
            Offset(
              x * 18,
              32 * 2.5,
            ),
            paint,
          );
          canvas.drawLine(
            Offset(
              x * 18,
              32,
            ),
            Offset(
              x * 18,
              32 * 2.5,
            ),
            paint,
          );
          canvas.drawLine(
            Offset(
              x * 18,
              (32 * 2.5) / 1.4,
            ),
            Offset(
              x * 18 + 20,
              (32 * 2.5) / 1.4,
            ),
            paint,
          );
        }
        canvas.drawRect(
            Offset((10 + (120 + 80) * z).toDouble(), spacey) &
                const Size(120, 40),
            Paint());
      }
    }

    //Text 1st Layer
    //Rectangles 1st Layer

    //Lines 1st Layer

    // //Rectangles 2nd Layer
    // canvas.drawRect(Offset(x, y * 12) & const Size(120, 40), Paint());
    // canvas.drawRect(Offset(x, y * 17) & const Size(120, 40), Paint());
    // canvas.drawRect(
    //     Offset(x * 18 + 20, 32 * 4.5) & const Size(120, 40), Paint());

    // //Lines 2nd Layer

    // canvas.drawLine(
    //   Offset(
    //     x * 13,
    //     35 * 4,
    //   ),
    //   Offset(
    //     x * 18,
    //     35 * 4,
    //   ),
    //   paint,
    // );
    // canvas.drawLine(
    //   Offset(
    //     x * 13,
    //     35 * 5.5,
    //   ),
    //   Offset(
    //     x * 18,
    //     35 * 5.5,
    //   ),
    //   paint,
    // );
    // canvas.drawLine(
    //   Offset(
    //     x * 18,
    //     35 * 4,
    //   ),
    //   Offset(
    //     x * 18,
    //     35 * 5.5,
    //   ),
    //   paint,
    // );

    // canvas.drawLine(
    //   Offset(x * 18, (32 * 4.5) + 20),
    //   Offset(
    //     x * 18 + 20,
    //     (32 * 4.5) + 20,
    //   ),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
