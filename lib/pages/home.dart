import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/pages/event.dart';
import 'package:liquid_bash/pages/home_default.dart';
import 'package:liquid_bash/pages/registration.dart';
import 'package:liquid_bash/pages/tournaments.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List _screens = [
    const RegistrationPage(),
    const TournamentsPage(),
    const HomeDefault(),
    const EventPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/logo.png', height: 32),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          iconSize: 20,
          backgroundColor: Theme.of(context).primaryColorDark,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.rss_feed),
              label: 'News',
              backgroundColor: Theme.of(context).primaryColorDark,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              label: 'Tournaments',
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Theme.of(context).primaryColorDark,
            ),
          ],
        ));
  }
}
