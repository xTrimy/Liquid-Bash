import 'package:flutter/material.dart';
import 'package:liquid_bash/components/styles.dart';
import 'package:liquid_bash/services/tournament_service.dart';

void main() {
  runApp(ParticipantsPage());
}

class ParticipantsPage extends StatefulWidget {
  const ParticipantsPage({Key? key}) : super(key: key);

  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<ParticipantsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: Text('tournment participants'),
            backgroundColor: Colors.greenAccent[700],
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(100.0),
                border: TableBorder.all(
                    color: Colors.white, style: BorderStyle.solid, width: 3),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Participants',
                          style: TextStyle(fontSize: 15.0, color: Colors.green))
                    ]),
                    Column(children: [
                      Text('Tournment2',
                          style: TextStyle(fontSize: 15.0, color: Colors.green))
                    ]),
                    Column(children: [
                      Text('Score',
                          style: TextStyle(fontSize: 15.0, color: Colors.green))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Participant1',
                          style: TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      Text('Fortnite', style: TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      Text('5', style: TextStyle(color: Colors.white))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Participant2',
                          style: TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      Text('Valorant', style: TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      Text('4', style: TextStyle(color: Colors.white))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Text('Participant3',
                          style: TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      Text('LOL', style: TextStyle(color: Colors.white))
                    ]),
                    Column(children: [
                      Text('3', style: TextStyle(color: Colors.white))
                    ]),
                  ]),
                ],
              ),
            ),
          ]))),
    );
  }
}
