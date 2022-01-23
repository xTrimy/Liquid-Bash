import 'package:flutter/material.dart';
import 'package:liquid_bash/models/news.dart';
import 'package:liquid_bash/services/news_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  @override
  Widget build(BuildContext context) {
    NewsService newsService = Provider.of<NewsService>(context, listen: true);
    Future.delayed(Duration(seconds: 0), () async {
      newsService.fetchNews().then((value) {});
    });
    List<News> news = newsService.getNews();
    if (news.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 2,
                  child: const CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
                Image.asset(
                  "assets/Lmark.png",
                  width: 40,
                  height: 40,
                )
              ],
            )
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: news.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            "News Feed",
            style: Theme.of(context).textTheme.headline6,
          );
        }
        if (news[index - 1].img == null) return SizedBox();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: NewsCard(
            title: news[index - 1].title!,
            permalink: news[index - 1].permalink!,
            image: news[index - 1].img,
          ),
        );
      },
      padding: EdgeInsets.all(20),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String permalink;
  final String? image;
  final String? description;
  const NewsCard({
    Key? key,
    required this.title,
    required this.permalink,
    this.image,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: double.infinity,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () async {
            if (!await launch(permalink)) throw 'Could not launch ';
          },
          child: Container(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            )),
          ),
          highlightColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          splashColor: Color.fromRGBO(0, 255, 136, 0.5),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
            image: (image != null) ? NetworkImage(image!) : NetworkImage(""),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
