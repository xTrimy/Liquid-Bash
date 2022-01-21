import 'package:flutter/material.dart';

class TournamentBrackets extends StatefulWidget {
  const TournamentBrackets({Key? key}) : super(key: key);

  @override
  _AddTournmentState createState() => _AddTournmentState();
  _NextStepBrackets CreateState() => _NextStepBrackets();
}

class _AddTournmentState extends State<TournamentBrackets> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  int _value = 1;
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
                  'CREATE \nBRACKET',
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
                  child: Text("BASICS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Select Tournament',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    hintStyle: TextStyle(fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Bracket Name',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    hintStyle: TextStyle(fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  child: Text("BRACKET",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        'Select Bracket Size',
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 255, 136)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("Bracket of 8"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Bracket of 16"),
                              value: 2,
                            )
                          ],
                          onChanged: (int? value) {
                            setState(() {
                              _value = value!;
                            });
                          },
                          hint: Text("Select item")),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      child: const Text("Next"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => _NextStepBrackets()));
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NextStepBrackets extends StatelessWidget {
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
                  'CREATE \nBRACKET',
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
                  child: Text("BASICS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Select Tournament',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    hintStyle: TextStyle(fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Bracket Name',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    hintStyle: TextStyle(fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Let's Go"),
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
