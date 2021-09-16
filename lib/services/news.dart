import 'dart:convert';
import '../models/new_data.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/models/new_data.dart';

class NewsService {
  List<NewsData> dataList = [];
  String baseUrl = "https://newsapi.org/v2/top-headlines";
  String apiKey = "463f3c8b3f8e406dbcd258313907a03f";

  Future<String> fetchData() async {
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

  Future<String> fetchDataByGategory(String category) async {
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

  // Future<String> fetchData(String? category) async {
  //   Uri url = Uri.parse("$baseUrl?country=us&apiKey=$apiKey");
  //   Uri urlWithCategory =
  //       Uri.parse("$baseUrl?country=us&category=$category&apiKey=$apiKey");

  //   if (category != '') {
  //     http.Response response = await http.get(urlWithCategory);

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = jsonDecode(response.body);

  //       jsonResponse['articles'].forEach(
  //         (data) {
  //           if (data['urlToImage'] != null && data['description'] != null) {
  //             News news = News.fromJson(data);
  //             dataList.add(news);
  //           }
  //         },
  //       );
  //     }
  //   } else {
  //     http.Response response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = jsonDecode(response.body);

  //       jsonResponse['articles'].forEach(
  //         (data) {
  //           if (data['urlToImage'] != null && data['description'] != null) {
  //             News news = News.fromJson(data);
  //             dataList.add(news);
  //           }
  //         },
  //       );
  //     }
  //   }
  //   return "success";
  // }
}
