import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/pages/event.dart';
import 'package:liquid_bash/pages/home_default.dart';
import 'package:liquid_bash/pages/profile_page.dart';
import 'package:liquid_bash/pages/news.dart';
import 'package:liquid_bash/pages/registration.dart';
import 'package:liquid_bash/pages/tournaments.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_logged.dart';

class HomeLoggedT extends StatefulWidget {
  const HomeLoggedT({Key? key}) : super(key: key);

  @override
  State<HomeLoggedT> createState() => _HomeLoggedTState();
}

class _HomeLoggedTState extends State<HomeLoggedT> {
  
  int _selectedIndex = 0;
  final List _screens = [
    const NewsFeedPage(),
    const TournamentsPage(),
    const HomeLogged(),
    ProfilePage(),
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
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Theme.of(context).primaryColor,
          iconSize: 20,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.rss_feed),
              backgroundColor: Theme.of(context).primaryColorLight,
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              backgroundColor: Theme.of(context).primaryColorLight,
              label: 'Tournaments',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              backgroundColor: Theme.of(context).primaryColorLight,
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              backgroundColor: Theme.of(context).primaryColorLight,
              label: 'Profile',
            ),
          ],
        ));
  }
}
