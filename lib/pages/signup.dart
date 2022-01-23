import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:liquid_bash/components/styles.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomerFormState createState() {
    return MyCustomerFormState();
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

////////////////////////////////////////////////////////////
class MyCustomerFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String bdate = "";
  String password = '';
  String repassword = "";
  // final ageController = TextEditingController();

  TextEditingController bdateController = TextEditingController();
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Column(
      children: [
        const TopBanner(),
        Form(
            key: _formKey,
            child: Expanded(
              child: ListView(padding: const EdgeInsets.all(30.0), children: [
                TextFormField(
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      icon: Icon(Icons.person),
                      labelText: "Fullname",
                      hintStyle: TextStyle(fontSize: 14.0),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a Name";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  controller: bdateController,
                  format: format,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    icon: Icon(Icons.cake),
                    labelText: "Birth Date",
                    hintStyle: TextStyle(fontSize: 14.0),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  onChanged: (value) {
                    bdate = value as String;
                    print(bdate);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField( 
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      icon: Icon(Icons.email),
                      labelText: "Email",
                      hintStyle: TextStyle(fontSize: 14.0),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      hintStyle: TextStyle(fontSize: 14.0),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
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
                  height: 10,
                ),
                TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      icon: Icon(Icons.lock),
                      labelText: "Confirm Password",
                      hintStyle: TextStyle(fontSize: 14.0),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    onChanged: (value) {
                      repassword = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm Your Password";
                      } else if (password != repassword) {
                        return "Password Don't Match";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 30,
                  width: 200,
                ),
                ButtonBar(children: [
                  ElevatedButton(
                    //minimumSize: Size(100,40),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(135, 40),
                        primary: Colors.white,
                        onPrimary: Colors.black),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: const Text('BACK'),
                  ),
                  ElevatedButton(
                    //minimumSize: Size(100,40),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(135, 40)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          CollectionReference users =
                              FirebaseFirestore.instance.collection('users');
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);
                          var currentUser = FirebaseAuth.instance.currentUser;

                          var uidd = currentUser!.uid;

                          FirebaseFirestore.instance.collection("users").doc(uidd).set({
                            'uid': uidd,
                            'logged_in': false,
                            'name': name,
                            'bdate': bdateController.text,
                            'about': " ",
                            'image': "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                            'ranking': "0.0",
                            'followers': "0",
                            'following': "0",
                          });
                          

                          const snackBar = SnackBar(
                              duration: Duration(seconds: 3),
                              content: Text("Sucessfully Registered"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          await Future.delayed(
                              const Duration(seconds: 2), () {});

                          Navigator.pushNamed(context, "/login");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            const snackBar = SnackBar(
                                duration: Duration(seconds: 5),
                                content: Text("Weak Password"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (e.code == 'email-already-in-use') {
                            const snackBar = SnackBar(
                                duration: Duration(seconds: 5),
                                content: Text("Email Already Inuse"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
