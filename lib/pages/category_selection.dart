import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/models/game.dart';
import 'package:liquid_bash/services/game_service.dart';
import 'package:liquid_bash/services/users_service.dart';
import 'package:provider/provider.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');
var currentUser = FirebaseAuth.instance.currentUser;

Future<void> updateUserLoggedIn({required uid}) async {
  var document = null;
  await FirebaseFirestore.instance
      .collection('users')
      .where('uid', isEqualTo: uid)
      .get()
      .then((doc) {
    document = (doc.docs.first.id); // For doc name
  });
  return await users.doc(document).update({'logged_in': true}).catchError(
      (error) => print("Failed to update user: $error"));
}

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({Key? key}) : super(key: key);

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  @override
  Widget build(BuildContext context) {
    GameService gameService = Provider.of<GameService>(context, listen: false);
    Future.delayed(Duration(seconds: 0), () async {
      gameService.getGamedCollectionFromDatabase().then((value) {});
    });
    List<Game> games = gameService.getGames();
    UserService userService = Provider.of<UserService>(context, listen: false);
    bool loggedInBefore = userService.getIsLoggedInBefore();
    if (!gameService.getIsLoaded()) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 2,
                  child: const CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
                Image.asset(
                  "assets/Lmark.png",
                  width: 40,
                  height: 40,
                )
              ],
            )
          ],
        ),
      );
    } else {
      print(games);
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
          child: Column(
            children: [
              Text(
                "CHOOSE YOUR INTERESTS",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 250,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            child: Text("Back to Home"),
                            onPressed: () {
                              loggedInBefore = true;
                              updateUserLoggedIn(uid: currentUser!.uid);
                            }),
                      ),
                    ),
                    ...games.map((item) => SwipeCard(
                        id: item.id, name: item.name, image: item.img)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      color: Color(0xFFFF3A3A),
                      height: 70,
                      child: Icon(
                        Icons.thumb_down_rounded,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      color: Theme.of(context).accentColor,
                      height: 70,
                      child: Icon(
                        Icons.thumb_up_rounded,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

class SwipeCard extends StatefulWidget {
  final String image;
  final String name;
  final String id;
  const SwipeCard(
      {Key? key, required this.image, required this.name, required this.id})
      : super(key: key);

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  Offset _position = Offset(0, 0);
  int _animationDuration = 0;
  @override
  Widget build(BuildContext context) {
    UserService userService = Provider.of<UserService>(context, listen: false);
    var currentUser = userService.getCurrentUser();
    GameService gameService = Provider.of<GameService>(context, listen: false);
    Future.delayed(Duration(seconds: 0), () async {
      gameService.getGamedCollectionFromDatabase().then((value) {});
    });
    List<Game> games = gameService.getGames();
    return LayoutBuilder(builder: (context, constrains) {
      final screenWidth = MediaQuery.of(context).size.width;
      final center = constrains.smallest.center(Offset.zero);
      final rotatedMatrix = Matrix4.identity()
        ..translate(center.dx, center.dy)
        ..rotateZ(_position.dx / screenWidth)
        ..translate(-center.dx, -center.dy);
      final fillColorOpacity = _position.dx.abs() / screenWidth / 2;
      final fillColor = (_position.dx > 0)
          ? Color.fromRGBO(0, 255, 136, fillColorOpacity)
          : Color.fromRGBO(255, 0, 0, fillColorOpacity);
      return GestureDetector(
        onPanStart: (e) {
          setState(() {
            _animationDuration = 0;
          });
        },
        onPanUpdate: (e) {
          setState(() {
            _position += e.delta;
          });
        },
        onPanEnd: (e) {
          setState(() {
            if (games.first.id == widget.id) {
              updateUserLoggedIn(uid: currentUser!.uid);
            }
            bool yes = false;
            bool no = false;
            if (_position.dx > screenWidth / 2.5) {
              yes = true;
            } else if (_position.dx < -screenWidth / 2.5) {
              no = true;
            }
            if (yes) {
              FirebaseFirestore.instance.collection('game_user').doc().set({
                'game': "/games/" + widget.id,
                'user': "/users/" + currentUser!.uid
              });

              _animationDuration = 200;
              _position = Offset(500, -500);
            } else if (no) {
              _animationDuration = 200;
              _position = Offset(-500, -500);
            } else {
              _animationDuration = 100;
              _position = Offset.zero;
            }
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: _animationDuration),
          transform: rotatedMatrix
            ..translate(
                _position.dx,
                (_position.dx > 0)
                    ? _position.dy - _position.dx
                    : _position.dy + _position.dx),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: [
                Container(
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: fillColor,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
