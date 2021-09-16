// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

NewsData newsFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
  NewsData({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  String title;
  String description;
  String url;
  String urlToImage;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
      };
}
