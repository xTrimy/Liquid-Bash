import 'package:flutter/material.dart';
import 'package:liquid_bash/models/user.dart';
import 'package:liquid_bash/utils/user_preferences.dart' show UserPreferences;
import 'package:liquid_bash/widget/button_widget.dart';
import 'package:liquid_bash/widget/numbers_widget.dart';
import 'package:liquid_bash/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ListView(
      children: [
        const SizedBox(height: 24),
        ProfileWidget(
          imagePath: user.imagePath,
          onClicked: () async {},
        ),
        const SizedBox(height: 24),
        buildName(user),
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
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.white),
          )
        ],
      );
  Widget buildEditProfileButton() => ButtonWidget(
        text: 'Edit Profile',
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

  Widget buildAbout(User user) => Container(
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
