import 'package:cloud_firestore/cloud_firestore.dart';

class Userr {
  final String imagePath;
  final String name;
  final String username;
  final String email;
  final String about;
  final bool isDarkMode;

  Userr({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.username,
    required this.about,
    required this.isDarkMode,
  });

  factory Userr.fromDocument(DocumentSnapshot doc) {
    return Userr(
      imagePath: doc['name'],
      name: doc['name'],
      username: doc['name'],
      email: doc['email'],
      about: doc['name'],
      isDarkMode: true,
    );
  }
}

List dummyUsers = [
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "bodda@gmail.com",
      username: "Bodda",
      about: "Pro Player",
      isDarkMode: true),
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "abdelrahman@gmail.com",
      username: "Bodda",
      about: "Noob Player",
      isDarkMode: true),
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "bodda@gmail.com",
      username: "Test123",
      about: "Pro Player",
      isDarkMode: true),
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "abdelrahman@gmail.com",
      username: "Test1",
      about: "Noob Player",
      isDarkMode: true),
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "bodda@gmail.com",
      username: "Test2",
      about: "Pro Player",
      isDarkMode: true),
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "abdelrahman@gmail.com",
      username: "xxxxB",
      about: "Noob Player",
      isDarkMode: true),
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "bodda@gmail.com",
      username: "x8z9",
      about: "Pro Player",
      isDarkMode: true),
  Userr(
      imagePath: "assets/a.png",
      name: "Abdelrahman Sayed",
      email: "abdelrahman@gmail.com",
      username: "Faker",
      about: "Noob Player",
      isDarkMode: true),
];
