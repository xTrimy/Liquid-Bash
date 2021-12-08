import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/models/tournament.dart';

class Response extends StatefulWidget {
  const Response({Key? key}) : super(key: key);

  @override
  _ResponseState createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  bool state = false;

  // String status = "";
  // String message = "";
  // String image = "";

  Color buttonColor = Colors.greenAccent.shade700;
  Color buttonColort = Colors.white;

  String status = "SUCCESS \!";
  String message = "You have successfully registerd in Gamers Lounge Summer Cup V 'VALORANT' tournament ";
  String image = "assets/check.png";

  void toggleResponse() {
    setState(() {
      if(state) {
        status = "SUCCESS \!";
        message = "You have successfully registerd in Gamers Lounge Summer Cup V 'VALORANT' tournament ";
        image = "assets/check.png";
        buttonColor = Colors.greenAccent.shade700;
        state = !state;
      } else {
        status = "OOPS \!";
        message = "Unfortunately, you can't register in multiple tournaments at the same time";
        image = "assets/attention.png";
        buttonColor = Colors.white;
        buttonColort = Colors.black;
        state = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset('assets/logo.png', height: 32),
        ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              status,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0)
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0,)
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(image, 
          width: 200,
          height: 200,
          ),
          
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: ElevatedButton(
                  onPressed: () {toggleResponse();},
                  child: const Text("CONTINUE"),
                  style: ElevatedButton.styleFrom(
                            primary: buttonColor,
                            onPrimary: buttonColort,
                            elevation: 0,
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal)
                            // takes postional arguments as width and height
                  ),
            ),
          ),
        ],
      ),
    );
  }

}