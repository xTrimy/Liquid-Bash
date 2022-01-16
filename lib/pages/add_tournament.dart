import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AddTournment extends StatefulWidget {
  const AddTournment({Key? key}) : super(key: key);

  @override
  _AddTournmentState createState() => _AddTournmentState();
}

class _AddTournmentState extends State<AddTournment> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String start_date = "";
  String start_time = "";
  String poster_image = "";
  String contact = "";
  String contact_url = "";
  String rules = "";
  String prize_type = "";
  String prize_amount = "";
  String tournament_format = "";
  String platform = "";
  String see_participants = "";
  String participants_limit = "";
  String privacy = "";

  TextEditingController start_dateController = TextEditingController();
  final format = DateFormat("yyyy-MM-dd");

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
                                onChanged: (value) {
                                  start_date = value as String;
                                }, 
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
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
                                onChanged: (value) {
                                  start_time = value;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
                                  poster_image = value;
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
                                  contact_url = value;
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
                                  prize_type = value;
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
                                  prize_amount = value;
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
                                  tournament_format = value;
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
                                  see_participants = value;
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
                                  participants_limit = value;
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
                                      'start_date': start_date,
                                      'start_time': start_time,
                                      'img': poster_image,
                                      'contact': contact,
                                      'contact_url': contact_url,
                                      'rules': rules,
                                      'prize_type': prize_type,
                                      'prize_amount': prize_amount,
                                      'tournament_format': tournament_format,
                                      'platform': platform,
                                      'see_participants': see_participants,
                                      'participants_limit': participants_limit,
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