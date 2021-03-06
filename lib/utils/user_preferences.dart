import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liquid_bash/models/user.dart';

class UserPreferences {
  var currentUser = FirebaseAuth.instance.currentUser;

  static final myUser = Userr(
    imagePath:
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    name: 'Mohammed Trek',
    email: 'Mohammed@gmail.com',
    username: 'Tarek',
    about:
        'A gamer is a person who plays interactive games, especially video games, tabletop role-playing games, and skill-based card games, and who plays for usually long periods of time. ',
    isDarkMode: false,
  );
}
