import 'package:flutter/material.dart';

class RegistrationFirst extends StatefulWidget {
  const RegistrationFirst({Key? key}) : super(key: key);

  @override
  _RegistrationFirstState createState() => _RegistrationFirstState();
}

class _RegistrationFirstState extends State<RegistrationFirst> {
  Color cardAccent = const Color(0xFFFFFFFF);
  
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Image.asset('assets/logo.png', height: 32),
        ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Gamers Lounge Summer Cup V",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "CHOOSE A GAME TO REGISTER",
              
              style:  TextStyle(fontWeight: FontWeight.normal, color: Colors.grey ,fontSize: 16.0)
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  child: SizedBox(
                    width: _width * 0.5 - 25,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          "assets/logos/fortnite-f.png",
                          height: 80,
                          width: 80,
                          
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(child: Text(
                                    'FORTNITE',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)
                                  ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  child: SizedBox(
                    width: _width * 0.5 - 25,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          "assets/logos/valorant-logo.png",
                          height: 80,
                          width: 80,
                          
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(child: Text(
                                    'VALORANT',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)
                                  ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
  
}