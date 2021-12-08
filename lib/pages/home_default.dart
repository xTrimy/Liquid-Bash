import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeDefault extends StatelessWidget {
  const HomeDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var currentUser = FirebaseAuth.instance.currentUser;
    // if (currentUser != null) {

    //   print("User id = "+currentUser.uid);
    // }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
              child: const Text("Sign Up"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white)),
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Text("Sign In"),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
