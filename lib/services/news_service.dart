import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liquid_bash/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService extends ChangeNotifier {
  bool _isLoaded = false;

  List<News> _news = [];
  List<News> getNews() {
    return _news;
  }

  bool getIsLoaded() {
    return _isLoaded;
  }

  Future<void> fetchNews() async {
    if (_news.length > 0) return;

    final response =
        await http.get(Uri.parse('https://api.gamerslegacy.net/news/api/news'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var allData = jsonDecode(utf8.decode(response.bodyBytes));

      allData.forEach((element) {
        print("x");
        print(element);
        notifyListeners();
        News news = News.fromJson(element);
        _news.add(news);
        _isLoaded = true;
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load news');
    }
  }
}
