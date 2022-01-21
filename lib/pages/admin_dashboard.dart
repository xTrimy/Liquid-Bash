import 'package:flutter/material.dart';
import 'package:liquid_bash/pages/view_users.dart';

class Adminhome extends StatelessWidget {
  Widget _buildcontainer(
      {IconData? icon,
      int? count,
      String? name,
      BuildContext? context,
      String? path}) {
    return Card(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(icon),
                  color: Colors.white,
                  onPressed: () {},
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
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Manage",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            backgroundColor: Colors.black,
            title: Text(
              "Admin home",
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/view-users");
                        },
                        child: _buildcontainer(
                          context: context,
                          count: 9,
                          icon: Icons.person,
                          name: "User",
                        ),
                      ),
                      _buildcontainer(
                        context: context,
                        count: 2,
                        icon: Icons.person,
                        name: "Tournaments ",
                      ),
                      _buildcontainer(
                        context: context,
                        count: 5,
                        icon: Icons.person,
                        name: "Events",
                      ),
                      _buildcontainer(
                        context: context,
                        count: 10,
                        icon: Icons.person,
                        name: "News",
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
