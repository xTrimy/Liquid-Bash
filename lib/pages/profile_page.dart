import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/models/user.dart';
import 'package:liquid_bash/services/game_service.dart';
import 'package:liquid_bash/services/users_service.dart';
import 'package:liquid_bash/utils/user_preferences.dart' show UserPreferences;
import 'package:liquid_bash/widget/button_widget.dart';
import 'package:liquid_bash/widget/numbers_widget.dart';
import 'package:liquid_bash/widget/profile_widget.dart';
import 'package:liquid_bash/pages/edit_profile_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String email = "";
  List<Game> games = [];
  UserService? userService = null;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    userService = Provider.of<UserService>(context, listen: false);
    Future.delayed(Duration(seconds: 0), () async {
      userService!.loadUserGames().then((value) {});
    });
    games = userService!.getUserGames();
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userService = Provider.of<UserService>(context, listen: true);

    final user = UserPreferences.myUser;
    var currentUser = FirebaseAuth.instance.currentUser;

    email = currentUser!.email!;

    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        name = doc["name"];
        // email = doc["email"];
      }
    });

    // user.name = name;

    return SizedBox(
      height: double.infinity,
      child: ListView(
        children: [
          const SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(name, email),
          const SizedBox(height: 24),
          Center(
            child: buildEditProfileButton(),
          ),
          const SizedBox(height: 5),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget buildName(String name, String email) => Column(
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(color: Colors.white),
          )
        ],
      );
  Widget buildEditProfileButton() => ButtonWidget(
        text: 'Edit Profile',
        color: Colors.white,
        onClicked: () {
          Navigator.pushNamed(context, "/edit-profile");
        },
      );
  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {
          Navigator.pushNamed(context, "/upgradetopro");
        },
      );

  Widget buildAbout(Userr user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              'Favourite Games',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            buildGames(),
          ],
        ),
      );
  Widget buildGames() {
    if (userService!.isUserGamesLoaded()) {
      return Container(
        height: 200,
        child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              return Text(games[index].name);
            }),
      );
    } else {
      return Center(
        child: Text('loading'),
      );
    }
  }
}
