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
  String about = "";
  String image = "";

  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

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

    var currentUser = FirebaseAuth.instance.currentUser;

    email = currentUser!.email!;

    return SizedBox(
      height: double.infinity,
      child: StreamBuilder<DocumentSnapshot>(
        stream: usersCollection.doc(currentUser.uid).snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          return ListView(
            children: [
              const SizedBox(height: 24),
              ProfileWidget(
                imagePath: streamSnapshot.data!['image'],
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              buildName(streamSnapshot.data!['name'], email),
              const SizedBox(height: 24),
              Center(
                child: buildEditProfileButton(),
              ),
              const SizedBox(height: 5),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      onPressed: () {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            streamSnapshot.data!['ranking'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Ranking',
                            style:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                      width: 5,
                      child: VerticalDivider(color: Colors.white),
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      onPressed: () {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            streamSnapshot.data!['following'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Following',
                            style:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                      width: 5,
                      child: VerticalDivider(color: Colors.white),
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      onPressed: () {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            streamSnapshot.data!['followers'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Followers',
                            style:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              buildAbout(streamSnapshot.data!['about']),
              const SizedBox(height: 24),
            ],
          );
        }
      ),
    );
  }

  Widget buildName(String name, String email) => Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: const TextStyle(color: Colors.white),
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

  Widget buildAbout(String about) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              about,
              style: const TextStyle(fontSize: 16, height: 1.4, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
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
      return SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              return Text(games[index].name);
            }),
      );
    } else {
      return const Center(
        child: Text('loading'),
      );
    }
  }
}
