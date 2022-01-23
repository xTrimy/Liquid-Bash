import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liquid_bash/models/tournament_game.dart';
import 'package:liquid_bash/pages/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:liquid_bash/services/users_service.dart';
import 'package:provider/provider.dart';

class HomeLogged extends StatefulWidget {
  const HomeLogged({Key? key}) : super(key: key);

  @override
  State<HomeLogged> createState() => _HomeLoggedState();
}

class _HomeLoggedState extends State<HomeLogged> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    UserService userService = Provider.of<UserService>(context, listen: true);
    Future.delayed(Duration(seconds: 0), () async {
      userService.loadTournamentGames().then((value) {});
    });
    List<TournamentGame> tournament_games =
        userService.getUserTournamentGames();
    final CarouselController _controller = CarouselController();
    final List<String> imgList = [
      "https://pbs.twimg.com/media/EX_FIhOU4AM-3xt.jpg",
      'https://i.pinimg.com/originals/45/45/36/454536e47e796dfc15f2e3b20d45ccf0.png',
      'https://www.adweek.com/wp-content/uploads/2021/02/FacebookGamingCGNYValorantTournament.jpg',
      'https://theciaa.com/images/2021/2/19/CIAA_ESPORTS_MAIN.jpg?width=1024&height=576&mode=crop',
      'https://venturebeat.com/wp-content/uploads/2021/03/Polyient-Tournament-Image.jpg?w=1200&strip=all',
      'https://www.ginx.tv/uploads/T1_Valorant_Invitational.jpg',
    ];
    // Future<void> _signOut() async {
    //   await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()),(route) => false)));
    // }

    Future logout() async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new HomePage()),
          (route) => false);

      userService.updateUser();
    }

    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      Navigator.pushNamed(context, "/");
    }

    if (currentUser != null) {
      // print("User id = "+currentUser.uid);
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
            items: imgList
                .map((item) => Container(
                      padding: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: Image.network(
                              item.toString(),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Column(
            children: tournament_games.asMap().entries.map((e) {
              print(e);
              return Container(
                width: double.infinity,
                child: Text(e.value.tournament.name!),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              logout();
            },
            child: const Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
