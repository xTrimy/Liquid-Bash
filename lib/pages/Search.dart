import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_bash/services/DataController.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;
  bool isExcecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            // onTap: () {
            //   Get.to(TornumentsPage(),
            //       transition: Transition.downToUp,
            //       arguments: snapshotData.docs[index]);
            // },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(snapshotData.docs[index].data()['img']),
              ),
              title: Text(
                snapshotData.docs[index].data()['name'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
              subtitle: Text(
                snapshotData.docs[index].data()['status'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            isExcecuted = false;
          });
        },
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      val.queryData(searchController.text).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExcecuted = true;
                        });
                      });
                    });
              })
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search Tournements',
              hintStyle: TextStyle(color: Colors.white)),
          controller: searchController,
        ),
        backgroundColor: Colors.black,
      ),
      body: isExcecuted
          ? searchedData()
          : Container(
              child: Center(
              child: Text('Search any Tournemnts',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
            )),
    );
  }
}
