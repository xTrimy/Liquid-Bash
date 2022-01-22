// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.grey,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
              text: 'Tournemts',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Favorite',
              icon: Icons.favorite,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'news',
              icon: Icons.new_releases,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 25),
            Divider(color: Colors.white70),
            const SizedBox(height: 25),
            buildMenuItem(
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
  Navigator.of(context).pop();

  // switch (index) {
  //   case 0:
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => TournementsPage(),
  //     ));
  //     break;
  //   case 1:
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => TournementsPage(),
  //     ));
  //     break;
  //   case 2:
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => TournementsPage(),
  //     ));
  //     break;
  //   case 3:
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => TournementsPage(),
  //     ));
  //     break;
  //   case 4:
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => TournementsPage(),
  //     ));
  //     break;
  // }
}
