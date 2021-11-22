import 'package:flutter/material.dart';
import 'package:liquid_bash/components/drawer.dart';
import 'package:liquid_bash/components/styles.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 32),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Text("test"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
