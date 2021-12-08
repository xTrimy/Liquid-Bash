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
    NewsService newsService = Provider.of<NewsService>(context, listen: false);
    List<News> news = newsService.getNews();
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
