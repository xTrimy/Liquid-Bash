import 'package:flutter/material.dart';
import 'package:liquid_bash/utils/user_preferences.dart';
import 'package:liquid_bash/widget/profile_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            ProfilePicture(),
            SizedBox(
              height: 20,
            ),
            EditProfileForm(),
          ],
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileWidget(
              imagePath: UserPreferences.myUser.imagePath, onClicked: () {}),
        ],
      ),
    );
  }
}

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Expanded(
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: [
            Text("Username", style: TextStyle(fontSize: 15)),
            TextFormField(
              initialValue: UserPreferences.myUser.username,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person), hintText: "Username"),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Email Address", style: TextStyle(fontSize: 15)),
            TextFormField(
              initialValue: UserPreferences.myUser.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), hintText: "Email"),
            ),
          ],
        ),
      ),
    );
  }
}
