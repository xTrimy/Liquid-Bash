import 'package:flutter/material.dart';

class TournamentRegister extends StatelessWidget {
  Widget _buildcontainer(
      {IconData? icon, int? count, String? name, BuildContext? context}) {
    return Card(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 35, color: Colors.white),
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
            SizedBox(
              height: 20,
            ),
            Text(
              count.toString(),
              style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context!).primaryColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              tabs: [
                Text(
                  "CHOOSE A GAME TO REGISTER",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.black,
            title: Text(
              "Gamers Lounge Summer Cup V",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Container(
            child: TabBarView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: GridView.count(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: [
                      _buildcontainer(
                        context: context,
                        count: 20,
                        
                        name: "Valorant",
                      ),
                      _buildcontainer(
                        context: context,
                        count: 2,
                        icon: Icons.person,
                        name: "Fortnite ",
                      ),
                      _buildcontainer(
                        context: context,
                        count: 5,
                        icon: Icons.person,
                        name: "League of legands",
                      ),
                      _buildcontainer(
                        context: context,
                        count: 10,
                        icon: Icons.person,
                        name: "valorant",
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Manage"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
