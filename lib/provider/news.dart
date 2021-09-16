import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/models/new_data.dart';

class News {
  List<NewsData> _dataList = [];
  String baseUrl = "https://newsapi.org/v2/top-headlines";
  String apiKey = "463f3c8b3f8e406dbcd258313907a03f";

  List<NewsData> get dataList => _dataList;

  set dataList(List<NewsData> dataList) {
    _dataList = dataList;
  }

  Future<String> fetchDatas() async {
    Uri url = Uri.parse("$baseUrl?country=us&apiKey=$apiKey");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      jsonResponse['articles'].forEach(
        (data) {
          if (data['urlToImage'] != null && data['description'] != null) {
            NewsData news = NewsData.fromJson(data);
            dataList.add(news);
          }
        },
      );
    }
    return "success";
  }

  Future<String> fetchDatasByGategory(String category) async {
    Uri url =
        Uri.parse("$baseUrl?country=us&category=$category&apiKey=$apiKey");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      jsonResponse['articles'].forEach(
        (data) {
          if (data['urlToImage'] != null && data['description'] != null) {
            NewsData news = NewsData.fromJson(data);
            dataList.add(news);
          }
        },
      );
    }
    return "success";
  }
}
