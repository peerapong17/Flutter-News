// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  String title;
  String description;
  String url;
  String urlToImage;

  factory News.fromJson(Map<String, dynamic> json) => News(
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
