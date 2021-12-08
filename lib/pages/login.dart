import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    double width = (MediaQuery.of(context).size.width) - 30;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      height: (MediaQuery.of(context).size.height - 335),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Login",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26.0),
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
                          TextFormField(
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 10, 0),
                              icon: Icon(Icons.person),
                              hintText: "Username",
                              hintStyle: TextStyle(fontSize: 12.0),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                            onChanged: (value) {
                              email = value.toString().trim();
                            },
                          ),
                          TextFormField(
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 0),
                              icon: const Icon(Icons.lock),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 12.0, color: Colors.grey[500]),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              suffixIcon: IconButton(
                                color: const Color(0xff94959b),
                                splashRadius: 1,
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePassword,
                              ),
                            ),
                            onChanged: (value) {
                              password = value.toString().trim();
                            },
                          ),
                          SizedBox(
                            height: 30,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                        child: ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            "Create Account ?\n SIGN UP",
                            textAlign: TextAlign.center,
                          ),
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
                            minimumSize: Size(width / 2,
                                48), // takes postional arguments as width and height
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: email, password: password);
                                const snackBar = SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text("Logged In"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                await Future.delayed(
                                    const Duration(seconds: 2), () {});
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                ;
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  const snackBar = SnackBar(
                                      duration: Duration(seconds: 5),
                                      content: Text(
                                          "No user found for that email."));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else if (e.code == 'wrong-password') {
                                  const snackBar = SnackBar(
                                      duration: Duration(seconds: 5),
                                      content: Text(
                                          "Wrong password provided for that user."));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('data')),
                              // );
                            }
                          },
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
