import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liquid_bash/services/users_service.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInForm(),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  FormContainer createState() {
    return FormContainer();
  }
}

class TopBanner extends StatelessWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 250;
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/valorant.jpg',
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: const Color.fromRGBO(0, 0, 0, 0.4),
          height: height,
          width: double.infinity,
        ),
      ],
    );
  }
}

class FormContainer extends State<SignInForm> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width) - 30;
    return Column(children: [
      const TopBanner(),
      Form(
        key: _formKey,
        child: Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      // height: (MediaQuery.of(context).size.height - 335),
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
                            "Login to start your journey.",
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
                              contentPadding:EdgeInsets.fromLTRB(10, 20, 10, 0),
                              icon: Icon(Icons.person),
                              labelText: "Email",
                              hintStyle: TextStyle(fontSize: 12.0),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                            onChanged: (value) {
                              email = value.toString().trim();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter your email";
                              }
                              return null;
                            }
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 0),
                              icon: const Icon(Icons.lock),
                              labelText: "Password",
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter your password";
                              }
                              return null;
                            }
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
                      )
                      ),
                  SizedBox(
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
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                        ),
                        ElevatedButton(
                          child: const Text("SIGN IN"),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(width / 2, 48),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                                const snackBar = SnackBar(duration: Duration(seconds: 3),content: Text("Logged In"));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                UserService userService = Provider.of<UserService>(context,listen: false);
                                await Future.delayed(const Duration(seconds: 2), () {
                                  userService.updateUser();
                                });

                                Navigator.pushNamed(context, "/");
                                // Navigator.of(context, rootNavigator: true).pop();
                                
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  const snackBar = SnackBar(duration: Duration(seconds: 5),content: Text("No user found for that email."));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else if (e.code == 'wrong-password') {
                                  const snackBar = SnackBar(duration: Duration(seconds: 5),content: Text("Wrong password provided for that user."));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              }
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('data')),
                              // );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
