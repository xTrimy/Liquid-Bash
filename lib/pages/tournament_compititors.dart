import 'dart:ffi';

import 'package:flutter/material.dart';

class TournamentCompititors extends StatefulWidget {
  const TournamentCompititors({Key? key}) : super(key: key);

  @override
  _AddTournmentState createState() => _AddTournmentState();
}

class _AddTournmentState extends State<TournamentCompititors> {
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
              height: MediaQuery.of(context).size.height - 100,
              child: ListView(
                children: [
                  Text(
                    'COMPETITORS ',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ).copyWith(color: Colors.white),
                  ),
                  Text(
                    'Round Robin (Round 1)',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ).copyWith(color: Colors.white),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' RAD Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/raad.png',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 25,
                          child: Text(
                            ' VS ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/anubis.png',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          ' ANB Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(6),
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.1,
                          0.4,
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.red.shade700,
                          Colors.red.shade400,
                          Colors.yellow.shade900,
                          Colors.yellowAccent.shade700,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' 3BL Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/3bl.png',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 25,
                          child: Text(
                            ' VS ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/qls.png',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          ' QLS Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(6),
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.1,
                          0.4,
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.cyan.shade700,
                          Colors.cyan.shade400,
                          Colors.brown.shade400,
                          Colors.brown.shade900,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' GK  Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/gky.png',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 25,
                          child: Text(
                            ' VS ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/opy.png',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          ' OPY Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(6),
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.1,
                          0.3,
                          0.8,
                          0.9,
                        ],
                        colors: [
                          Colors.red.shade700,
                          Colors.red.shade900,
                          Colors.blue.shade900,
                          Colors.blue.shade800,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' CLT Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/clt.jpg',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 25,
                          child: Text(
                            ' VS ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/fox.png',
                          ),
                          color: Colors.black,
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          ' FOX Esports ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(6),
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.1,
                          0.4,
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.orangeAccent.shade700,
                          Colors.orange.shade900,
                          Colors.cyan.shade900,
                          Colors.green.shade700,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('Powered By'),
                        Image.asset(
                          'assets/bme.png',
                          height: 100,
                          width: 150,
                        ),
                      ],
                    ),
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

// class _NextStepBrackets extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Image.asset('assets/logo.png', height: 32),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'CREATE \nBRACKET',
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w700,
//                   ).copyWith(color: Colors.white),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Image.asset(
//                   'assets/accent.png',
//                   width: 99,
//                   height: 4,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const SizedBox(
//                   child: Text("BASICS",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.white)),
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Select Tournament',
//                     isDense: true,
//                     contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
//                     hintStyle: TextStyle(fontSize: 12.0),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.green),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Bracket Name',
//                     isDense: true,
//                     contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
//                     hintStyle: TextStyle(fontSize: 12.0),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.green),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Let's Go"),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
