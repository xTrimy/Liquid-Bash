import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liquid_bash/pages/home.dart';

class HomeLogged extends StatelessWidget {
  const HomeLogged({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Future<void> _signOut() async {
    //   await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()),(route) => false)));
    // }

    Future logout() async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) =>
                new HomePage()),
        (route) => false);
    }
    var currentUser = FirebaseAuth.instance.currentUser;
    
    if (currentUser == null) {
      Navigator.pushNamed(context, "/");
    }

    if (currentUser != null) {
      
      print("User id = "+currentUser.uid);
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [

          
          MaterialButton(
              minWidth: double.infinity,
              onPressed: () {
                logout();
                
              },
              child: const Text("Sign Out"),
              color: Theme.of(context).colorScheme.secondary),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
