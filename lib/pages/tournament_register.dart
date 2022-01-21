import 'package:flutter/material.dart';

class TournamentRegister extends StatelessWidget {
  Widget _buildcontainer(
      {IconData? icon,
      required String img,
      String? name,
      BuildContext? context}) {
    return Card(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                      child: Image.asset(img,
                          width: double.infinity, height: double.infinity),
                      width: 60,
                      height: 60),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  name!,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Gamers Lounge Summer Cup V",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: GridView.count(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 2,
            children: [
              _buildcontainer(
                context: context,
                img: "assets/logos/valorant-logo.png",
                name: "Valorant",
              ),
              _buildcontainer(
                context: context,
                img: "assets/logos/fortnite-f.png",
                icon: Icons.person,
                name: "Fortnite ",
              ),
              _buildcontainer(
                context: context,
                img: "assets/logos/lol.jpg",
                icon: Icons.person,
                name: "League of legands",
              ),
              _buildcontainer(
                context: context,
                img: "assets/logos/valorant-logo.png",
                icon: Icons.person,
                name: "valorant",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
