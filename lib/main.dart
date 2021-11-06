import 'package:flutter/material.dart';
import 'package:news_api/screens/news_page.dart';
import 'package:news_api/state/news.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<News>(
      create: (context) => News(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsPage(),
      ),
    );
  }
}
