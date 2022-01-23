// import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/pages/Search.dart';
import 'package:liquid_bash/pages/home.dart';
import 'package:liquid_bash/pages/news.dart';
import 'package:liquid_bash/pages/profile_page.dart';
import 'package:liquid_bash/pages/tournaments.dart';
import 'package:liquid_bash/services/users_service.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColorDark,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
              context: context,
              text: 'Search Tournemts',
              icon: Icons.search,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              context: context,
              text: 'Tournemts',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              context: context,
              text: 'news',
              icon: Icons.new_releases,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 25),
            Divider(color: Colors.white70),
            const SizedBox(height: 25),
            buildMenuItem(
              context: context,
              text: 'Logout',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 4),
            ),
          ],
        ),
      ),
    );
  }
}

buildMenuItem({
  required BuildContext context,
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Future logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new HomePage()),
        (route) => false);
    UserService userService = Provider.of<UserService>(context, listen: false);
    userService.updateUser();
  }

  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Search(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TournamentsPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const NewsFeedPage(),
      ));
      break;
    case 3:
      logout();
      break;
  }
}
