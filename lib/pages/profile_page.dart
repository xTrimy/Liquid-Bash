import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/models/user.dart';
import 'package:liquid_bash/utils/user_preferences.dart' show UserPreferences;
import 'package:liquid_bash/widget/button_widget.dart';
import 'package:liquid_bash/widget/numbers_widget.dart';
import 'package:liquid_bash/widget/profile_widget.dart'; 
import 'package:liquid_bash/pages/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String name = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    var currentUser = FirebaseAuth.instance.currentUser;

    email = currentUser!.email!;
    
    FirebaseFirestore.instance
    .collection('users')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            name = doc["name"];
            // email = doc["email"];
        });
    });

    // user.name = name;

    return ListView(
      children: [
        const SizedBox(height: 24),
        ProfileWidget(
          imagePath: user.imagePath,
          onClicked: () async {},
        ),
        const SizedBox(height: 24),
        buildName(name, email),
        const SizedBox(height: 24),
        Center(child: buildUpgradeButton()),
        const SizedBox(height: 24),
        NumbersWidget(),
        const SizedBox(height: 48),
        buildAbout(user),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildName(String name, String email) => Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(color: Colors.white),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {
          Navigator.pushNamed(context, "/categories-selection");
        },
      );

  Widget buildAbout(Userr user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4, color: Colors.white),
            ),
          ],
        ),
      );
}
