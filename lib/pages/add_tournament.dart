import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'notification.dart';



class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}

class AddTournment extends StatefulWidget {
  const AddTournment({Key? key}) : super(key: key);

  @override
  _AddTournmentState createState() => _AddTournmentState();
}

class _AddTournmentState extends State<AddTournment> {

    String messageTitle = "Empty";
    String notificationAlert = "alert";
    String notificationData = "Data";


    late int _totalNotifications;

    late final FirebaseMessaging _messaging;

    void registerNotification() async {

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Parse the message received
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );

      setState(() {
        var _notificationInfo = notification;
        _totalNotifications++;
      });
    });
    } else {
      print('User declined or has not accepted permission');
    }
  }
  

  @override
  void initState() {
    _totalNotifications = 0;

    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    super.initState();
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationAlert = msg);
  _changeTitle(String msg) => setState(() => messageTitle = msg);

  bool passwordVisible = false;
  
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String startDate = "";
  String startTime = "";
  String posterImage = "";
  String contact = "";
  String contactUrl = "";
  String rules = "";
  String prizeType = "";
  String prizeAmount = "";
  String tournamentFormat = "";
  String platform = "";
  String seeParticipants = "";
  String participantsLimit = "";
  String privacy = "";

  TextEditingController startTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  final format = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    CollectionReference tournaments = FirebaseFirestore.instance.collection('tournaments');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: Image.asset('assets/logo.png', height: 32),
          ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                          'CREATE \nTOURNAMENT',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ).copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/accent.png',
                          width: 99,
                          height: 4,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                                child: Text("BASICS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                height: 25,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  name = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DateTimeField(
                                controller: startDateController,
                                format: format,
                                decoration: const InputDecoration(
                                  labelText: 'Start Date',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate: currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DateTimeField(
                                controller: startTimeController,
                                format: timeFormat,
                                decoration: const InputDecoration(
                                  labelText: 'Start Time',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onShowPicker: (context, currentValue) async {
                                  final TimeOfDay? time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                  );
                                  return time == null ? null : DateTimeField.convert(time);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // image == null ? Text("Choose") : Image.file(image!),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Poster Image',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  posterImage = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                child: Text("CONTACT INFO", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                height: 25,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'How will players contact you?',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  contact = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Contact URL',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  contactUrl = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                child: Text("TOURNAMENT INFO", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                height: 25,
                              ),
                              TextFormField(
                                maxLines: null,
                                minLines: 4,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  labelText: 'Rules',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  rules = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                child: Text("PRIZES", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                height: 25,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Prizetype',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  prizeType = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Prize Amount',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  prizeAmount = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Tournament Format',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  tournamentFormat = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Platform',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  platform = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                child: Text("SETTINGS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                height: 25,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Who should see participants?',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  seeParticipants = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Participants Limit',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  participantsLimit = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Tournament Privacy',
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  enabledBorder:
                                      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white),),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                onChanged: (value) {
                                  privacy = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      tournaments.add({
                                      'name': name,
                                      'start_date': startDateController.text,
                                      'start_time': startTimeController.text,
                                      'img': posterImage,
                                      'contact': contact,
                                      'contact_url': contactUrl,
                                      'rules': rules,
                                      'prize_type': prizeType,
                                      'prize_amount': prizeAmount,
                                      'tournament_format': tournamentFormat,
                                      'platform': platform,
                                      'see_participants': seeParticipants,
                                      'participants_limit': participantsLimit,
                                      'privacy': privacy,
                                    });
                                    const snackBar = SnackBar(duration: Duration(seconds: 3),content: Text("Tournament Added"));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    await Future.delayed(
                                      const Duration(seconds: 2), () {});
                                      Navigator.pushNamed(context, "/");
                                    } catch (e) {
                                      const snackBar = SnackBar(duration: Duration(seconds: 3),content: Text("Error Adding Tournament"));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                    
                                  },
                                  child: const Text("Ready To Go?"),
                                ),
                              ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}