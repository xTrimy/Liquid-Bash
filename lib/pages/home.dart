import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/pages/category_selection.dart';
import 'package:liquid_bash/pages/event.dart';
import 'package:liquid_bash/pages/home_default.dart';
import 'package:liquid_bash/pages/home_loggedt.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  int _selectedIndex = 0;
  final List _screens = [
    // const NewsFeedPage(),
    const HomeDefault(),
    const TournamentsPage(),
    // ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> updateUserLoggedIn({required uid}) async {
    var document = null;
    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get()
        .then((doc) {
      document = (doc.docs.first.id); // For doc name
    });
    return await users.doc(document).update({'logged_in': true}).catchError(
        (error) => print("Failed to update user: $error"));
  }

  bool loggedInBefore = false;
  bool checkLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      var currentUserData = FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: currentUser.uid)
          .get()
          .then((querySnapshot) {
        loggedInBefore = true;
        if (querySnapshot.docs.first.data()["logged_in"] != null ||
            checkLoggedIn == false) checkLoggedIn = true;
        setState(() {
          loggedInBefore = querySnapshot.docs.first.data()["logged_in"];
        });
      });
      if (!loggedInBefore) {
        return CategorySelectionPage();
      }
      return HomeLoggedT();
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
              icon: const Icon(Icons.home),
              backgroundColor: Theme.of(context).primaryColorLight,
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              backgroundColor: Theme.of(context).primaryColorLight,
              label: 'Tournaments',
            ),
          ],
        ));
  }
}
