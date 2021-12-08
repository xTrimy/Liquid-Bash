import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liquid_bash/components/styles.dart';
import 'package:liquid_bash/widget/button_widget.dart';
import 'package:liquid_bash/widget/numbers_widget.dart';
import 'package:liquid_bash/widget/profile_widget.dart';

class UpgradeToPro extends StatelessWidget {
  const UpgradeToPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListView(
          children: [
            Upgrade(),
            SizedBox(
              height: 2,
            ),
            Billing(),
            ElevatedButton(
              child: Text('become a pro!'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Upgrade extends StatelessWidget {
  const Upgrade({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360,
      child: Center(
        child: Container(
          width: 358,
          height: 312,
          decoration: BoxDecoration(
              color: Color(0x60000000),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Theme.of(context).accentColor,
                size: 80.0,
              ),
              SizedBox(
                width: 30,
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Become a pro now!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Theme.of(context).accentColor),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Choose your preferred PRO access plan',
                    style: TextStyle(fontSize: 16, color: Color(0x70FFFFFF)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 310,
                height: 91,
                decoration: BoxDecoration(
                    color: Color(0x20FFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Pro Plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '\$248',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 38,
                              color: Theme.of(context).accentColor),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '\\mo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0x50FFFFFF)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Billing extends StatelessWidget {
  const Billing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360,
      child: Center(
        child: Container(
          width: 358,
          height: 270,
          decoration: BoxDecoration(
              color: Color(0x60000000),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Billing information',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.credit_card),
                        hintText: "card number"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        hintText: "security code"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        hintText: "Expiration Date"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ElevatedButton(
      //minimumSize: Size(100,40),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 50),
          primary: Colors.white,
          onPrimary: Colors.black),
      onPressed: () {},
      child: const Text('BACK'),
    );
  }
}
