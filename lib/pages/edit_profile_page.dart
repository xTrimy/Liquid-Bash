import 'dart:io';

// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:liquid_bash/models/user.dart';
import 'package:liquid_bash/utils/user_preferences.dart';
import 'package:liquid_bash/widget/button_widget.dart';
import 'package:liquid_bash/widget/profile_widget.dart';
import 'package:liquid_bash/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(leading: BackButton()),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              icon: true,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
            const SizedBox(height: 24),
            ButtonWidget(text: 'Save', onClicked: () async {})
          ],
        ),
      );
}
