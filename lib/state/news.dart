import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/models/news.dart' as Model;

class News with ChangeNotifier {
  List<Model.News> _dataList = [];
  static const String BASE_URI = "https://newsapi.org/v2/top-headlines";
  static const String API_KEY = "463f3c8b3f8e406dbcd258313907a03f";

  List<Model.News> get dataList => _dataList;

  set dataList(List<Model.News> dataList) {
    _dataList = dataList;
  }

  Future<String> fetchData(String? category) async {
    _dataList.clear();
    Uri url = new Uri();
    if (category != null) {
      url =
          Uri.parse("$BASE_URI?country=us&category=$category&apiKey=$API_KEY");
    } else {
      url = Uri.parse("$BASE_URI?country=us&apiKey=$API_KEY");
    }

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        jsonResponse['articles'].forEach(
          (data) {
            if (data['urlToImage'] != null && data['description'] != null) {
              Model.News news = Model.News.fromJson(data);
              dataList.add(news);
            }
          },
        );
      }
    } catch (err) {
      print("An error occurred");
      print(err.toString());
      throw Exception("Something went wrong");
    }
    notifyListeners();
    return "success";
  }

  Future<String> fetchDatasByGategory(String category) async {
    Uri url =
        Uri.parse("$BASE_URI?country=us&category=$category&apiKey=$API_KEY");
    _dataList.clear();

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        jsonResponse['articles'].forEach(
          (data) {
            if (data['urlToImage'] != null && data['description'] != null) {
              Model.News news = Model.News.fromJson(data);
              dataList.add(news);
            }
          },
        );
      }
    } catch (err) {
      print(err.toString());
      throw Exception("Something went wrong");
    }
    notifyListeners();
    return "success";
  }
}
