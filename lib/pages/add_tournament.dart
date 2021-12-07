import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset('assets/logo.png', height: 32),
        ),
      body: ListView(
        children: [
          Container(
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
                            height: 20,
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            child: Text("CONTACT INFO", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            height: 20,
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            child: Text("TOURNAMENT INFO", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            height: 20,
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Ready To Go?"),
                            ),
                          ),
              ],
            ),
          )
        ],
      ),
    );
  }

}