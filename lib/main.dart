import 'package:flutter/material.dart';
import 'package:liquid_bash/components/drawer.dart';
import 'package:liquid_bash/pages/home.dart';
import 'package:liquid_bash/pages/event.dart';
import 'pages/registration.dart';
import 'pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/event': (context) => const EventPage(),
        '/register': (context) => RegistrationPage(),
        '/signup': (context) => const SignUp(),
        '/': (context) => HomePage(),
      },
      title: 'Liquid Bash',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          primaryColor: Colors.white,
          primaryColorDark: Colors.grey.shade900,
          accentColor: Colors.greenAccent.shade700,
          iconTheme: const IconThemeData(color: Colors.white),
          primaryIconTheme: const IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              color: Colors.grey.shade900,
              titleTextStyle: const TextStyle(
                color: Colors.white,
              ))),
    );
  }
}
