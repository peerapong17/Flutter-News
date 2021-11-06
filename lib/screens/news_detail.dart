import 'news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetail extends StatelessWidget {
  final String link;

  NewsDetail({required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => NewsPage(),
              ),
            );
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
