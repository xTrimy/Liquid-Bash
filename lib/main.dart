import 'package:flutter/material.dart';
import 'package:liquid_bash/components/drawer.dart';
import 'package:liquid_bash/pages/event.dart';
import 'pages/registration.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => const MyHomePage(title: 'Liquid Bash'),
        '/register': (context) => const RegistrationPage(),
        '/login': (context) => const LoginPage(),
      },
      title: 'Liquid Bash',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          primaryIconTheme: const IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              color: Colors.grey.shade900,
              titleTextStyle: const TextStyle(
                color: Colors.white,
              )), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.greenAccent.shade700)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 32),
      ),
      drawer: const MyDrawer(),
      body: const EventPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
