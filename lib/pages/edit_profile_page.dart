import 'dart:io';

// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  late File _imageFile;
  final picker = ImagePicker();
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  TextEditingController aboutController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  String url = "";

  Future<Uri?> uploadPic() async {
    late File _imageFile;

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    Reference reference =
        _storage.ref().child("profileImages/image" + DateTime.now().toString());

    UploadTask uploadTask = reference.putFile(_imageFile);

    uploadTask.whenComplete(() async {
      url = await reference.getDownloadURL();
      imageController.text = await reference.getDownloadURL();
    });
    return null;
  }

  Userr user = UserPreferences.myUser;
  User? userx = FirebaseAuth.instance.currentUser;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  String newName = "";
  String newEmail = "";
  String newAbout = "";
  String newImage = "";

  String oldAbout = "";
  String oldEmail = "";
  String oldName = "";
  String oldImage = "";

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
      print("x" + documentSnapshot.exists.toString());
      if (documentSnapshot.exists) {
        print("about: " + documentSnapshot['name']);
        oldAbout = documentSnapshot['about'];
        oldName = documentSnapshot['name'];
        oldEmail = userx!.email.toString();
        oldImage = documentSnapshot['image'];

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
                  Center(
                    child: Stack(
                      children: [
                        const SizedBox(height: 24),
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: Ink.image(
                              image: NetworkImage(streamSnapshot
                                      .data!['image'] ??
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                              fit: BoxFit.cover,
                              width: 128,
                              height: 128,
                              child: InkWell(onTap: () {}),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    onPressed: () {
                                      uploadPic();
                                    },
                                    child: const Icon(Icons.edit, size: 20),
                                  ))),
                        ),
                      ],
                    ),
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
                      if (value == "") {
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
                      if (value == "") {
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
                      if (value == "") {
                        newAbout = streamSnapshot.data!['about'];
                      } else {
                        newAbout = value;
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (newName == "") {
                        newName = streamSnapshot.data!['name'];
                      }

                      if (newAbout == "") {
                        newAbout = streamSnapshot.data!['about'];
                      }

                      if (url == "") {
                        url = oldImage;
                      }

                      if (newEmail == "" ||
                          newEmail == streamSnapshot.data!['email']) {
                        newEmail = userx!.email.toString();
                      } else {
                        String message;
                        userx!
                            .updateEmail(newEmail)
                            .then(
                              (value) => message = 'Success',
                            )
                            .catchError((onError) => message = 'error');
                      }

                      print("image" + imageController.text);

                      usersCollection.doc(userx!.uid).update({
                        'name': newName,
                        'email': newEmail,
                        'image': imageController.text,
                        'about': newAbout
                      });

                      if (oldEmail != newEmail) {
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
          }),
    );
  }
}
