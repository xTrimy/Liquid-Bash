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
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [

          
          MaterialButton(
              minWidth: double.infinity,
              onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
              child: const Text("Sign Up"),
              color: Theme.of(context).colorScheme.secondary),
          MaterialButton(
            minWidth: double.infinity,
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            child: const Text("Sign In"),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).colorScheme.secondary,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
