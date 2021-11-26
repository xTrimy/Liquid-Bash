import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liquid_bash/components/styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomerFormState createState() {
    return MyCustomerFormState();
  }
}
//////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////
class MyCustomerFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String name = ''; 
  String email = '';
  String password = '';
  // final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopBanner(),
        Form(
            key: _formKey,
            child: Expanded(
              child: ListView(padding: const EdgeInsets.all(8.0), children: [
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person), hintText: "Name"),
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a Name";
                      }
                      return null;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.cake), hintText: "BirthDate"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a number";
                      }
                      return null;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email), hintText: "Email"),
                    onChanged: (value) {
                      email = value.toString().trim();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your email";
                      }
                      return null;
                    }),
                TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock), hintText: "Password"),
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your password";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 60,
                  width: 200,
                ),
                ButtonBar(children: [
                  ElevatedButton(
                    //minimumSize: Size(100,40),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        primary: Colors.white,
                        onPrimary: Colors.black),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('data')),
                        );
                      }
                    },
                    child: const Text('BACK'),
                  ),
                  ElevatedButton(
                    //minimumSize: Size(100,40),
                    style: ElevatedButton.styleFrom(minimumSize: const Size(150, 50)),
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email,
                            password: password
                          );
                          const SnackBar(content: Text('Sucessfully Register'));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            const SnackBar(content: Text('Weak Password'));
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('data')),
                        // );
                      }
                    },
                    child: const Text('SIGN UP'),
                  ),
                ]),
              ]),
            )),
      ],
    );
  }
}
