import 'dart:io';

// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/pages/home.dart';
import 'package:liquid_bash/services/users_service.dart';
import 'package:path/path.dart';
import 'package:liquid_bash/models/user.dart';
import 'package:liquid_bash/utils/user_preferences.dart';
import 'package:liquid_bash/widget/button_widget.dart';
import 'package:liquid_bash/widget/profile_widget.dart';
import 'package:liquid_bash/widget/textfield_widget.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController aboutController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  
  Userr user = UserPreferences.myUser;
  User? userx = FirebaseAuth.instance.currentUser;
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  

  String newName = "";
  String newEmail = "";
  String newAbout = "";


  String oldAbout = "";
  String oldEmail = "";
  String oldName = "";

  

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Future logout() async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new HomePage()),
          (route) => false);
      UserService userService =
          Provider.of<UserService>(context, listen: false);
      userService.updateUser();
    }


    FirebaseFirestore.instance
    .collection('users')
    .doc(userx!.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        oldAbout = documentSnapshot['about'];
        oldName = documentSnapshot['name'];
        oldEmail = documentSnapshot['email'];

        aboutController.text = oldAbout;
        nameController.text = oldName;
        emailController.text = oldEmail;
      }
    });


    setState(() {
      aboutController.text = oldAbout;
        nameController.text = oldName;
        emailController.text = oldEmail;
    });



    return Scaffold(
        appBar: AppBar(leading: const BackButton()),
        body: StreamBuilder<DocumentSnapshot>(
          stream: usersCollection.doc(userx!.uid).snapshots(),
          builder: (context, streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }

            
            return Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                children: [
                  ProfileWidget(
                    imagePath: user.imagePath,
                    icon: true,
                    isEdit: true,
                    onClicked: () async {},
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Full Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: streamSnapshot.data!['name'],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      if(value == "") {
                        newName = streamSnapshot.data!['name'];
                      } else {
                        newName = value;
                      }
                      
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: userx!.email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      if(value == "") {
                        newEmail = streamSnapshot.data!['email'];
                      } else {
                        newEmail = value;
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: streamSnapshot.data!['about'],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    maxLines: 5,
                    onChanged: (value) {
                      if(value == "") {
                        newAbout = streamSnapshot.data!['about'];
                      } else {
                        newAbout = value;
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if(newName == "") {
                        newName = streamSnapshot.data!['name'];
                      }

                      if(newAbout == "") {
                        newAbout = streamSnapshot.data!['about'];
                      }

                      if(newEmail == "" || newEmail == streamSnapshot.data!['email']) {
                        newEmail = streamSnapshot.data!['email'];
                      } else {
                        String message;
                        userx!.updateEmail(newEmail).then((value) => message = 'Success',)
                        .catchError((onError) => message = 'error');
                      }

                      usersCollection
                      .doc(userx!.uid)
                      .update({'name': newName,'email': newEmail,'about': newAbout});

                      if(oldEmail != newEmail) {
                        logout();
                      }
                      

                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: const Text("Save"),
                  ),
                  const SizedBox(height: 24),
                  
                ],
              ),
            );
          }
        ),
      );
  }
}
