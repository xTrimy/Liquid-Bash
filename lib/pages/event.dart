import 'package:flutter/material.dart';
import 'package:liquid_bash/components/styles.dart';
import 'package:liquid_bash/services/tournament_service.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 32),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            EventBanner(scrollController: scrollController),
            Expanded(
                child: EventDetails(
              scrollController: scrollController,
            )),
          ],
        ),
      ),
    );
  }
}

class EventBanner extends StatefulWidget {
  final ScrollController scrollController;

  const EventBanner({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<EventBanner> createState() => _EventBannerState();
}

class _EventBannerState extends State<EventBanner> {
  double _height = 250;

  _scrollListener() {
    if (!(widget.scrollController.offset <=
            widget.scrollController.position.minScrollExtent &&
        !widget.scrollController.position.outOfRange)) {
      setState(() {
        _height = 100;
      });
    }
    if (widget.scrollController.offset <=
            widget.scrollController.position.minScrollExtent &&
        !widget.scrollController.position.outOfRange) {
      setState(() {
        _height = 200;
      });
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(_height);

    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: _height,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/valorant.jpg',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Wrap(children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Valorant\nTournament Is Here",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                      AnimatedCrossFade(
                        crossFadeState: (_height > 100)
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(milliseconds: 100),
                        secondChild: Container(),
                        firstChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Valorant | May 17, 2020",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              style: Styles.buttonStyle,
                              child: const Text("Register"),
                              onPressed: () {
                                Navigator.pushNamed(context, "/register");
                              },
                            )
                          ],
                        ),
                      ),
                    ])
              ]),
            ),
          ],
        ));
  }
}

class EventDetails extends StatefulWidget {
  final ScrollController scrollController;
  const EventDetails({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool? scrollAtTop;

  _scrollListener() {
    if (!(widget.scrollController.offset <=
            widget.scrollController.position.minScrollExtent &&
        !widget.scrollController.position.outOfRange)) {
      setState(() {
        scrollAtTop = false;
      });
    }
    if (widget.scrollController.offset <=
            widget.scrollController.position.minScrollExtent &&
        !widget.scrollController.position.outOfRange) {
      setState(() {
        scrollAtTop = true;
      });
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(vertical: 10, horizontal: 20);
    return ListView(
      controller: widget.scrollController,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logos/valorant.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Game Name",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("by Gamers Lounge"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.star_outlined, color: Colors.yellow),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Awards",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "\$250 Prize Pool",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.map, color: Colors.blue),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Regions",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "- EMEA\n- North America",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]),
        ),
        Stack(
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                "assets/galaxy.jpg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 100,
              color: const Color.fromRGBO(0, 0, 0, 0.8),
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: const Text(
                  "Register Now",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: edgeInsets,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
