import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class News {
  String? title;
  String? img;
  String? permalink;
  String? description;
  DateTime? date;

  News({
    this.title,
    this.img,
    this.permalink,
    this.description,
    this.date,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      img: json['image'],
      description: json['description'],
      permalink: json['permalink'],
      date: DateTime.parse(json['publish_date']),
    );
  }
}
