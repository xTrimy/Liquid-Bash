import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width) - 30;
    return Scaffold(
      // appBar: AppBar(
      //   title: Image.asset('assets/logo.png', height: 32),
      // ),
      // drawer: const MyDrawer(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 250.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.softLight),
              ),
            ),
          ),
          Container(
              height: (MediaQuery.of(context).size.height - 335),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 12.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      icon: Icon(Icons.person),
                      hintText: "Username",
                      hintStyle: TextStyle(fontSize: 12.0),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      icon: Icon(Icons.lock),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(fontSize: 12.0, color: Colors.grey[500]),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
              child: const Text("SIGN UP"),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).canvasColor,
                  minimumSize: Size(width / 2, 48),
                  onPrimary: Colors.white,
                  elevation: 0,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)
                  // takes postional arguments as width and height
                  ),
                  onPressed: () {
                Navigator.pushNamed(context, "/signup");
              },
            ),
                  ElevatedButton(
                    child: const Text("SIGN IN"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width/2, 48), // takes postional arguments as width and height
                    ),
                    onPressed: () async {
                      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
                      print(userCredential);
                    },
                  ),
                  ],
                    
              ),
            ),
          ),
        ],
      ),
            
          );
  }
}
    