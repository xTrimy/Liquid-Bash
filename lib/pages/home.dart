import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/pages/event.dart';
import 'package:liquid_bash/pages/home_default.dart';
import 'package:liquid_bash/pages/profile_page.dart';
import 'package:liquid_bash/pages/news.dart';
import 'package:liquid_bash/pages/registration.dart';
import 'package:liquid_bash/pages/tournaments.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  

  int _selectedIndex = 0;
  final List _screens = [
    const NewsFeedPage(),
    const TournamentsPage(),
    const HomeDefault(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      Navigator.pushNamed(context, "/homeloggedt");
      print(currentUser.uid);
    }


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
