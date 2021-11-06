import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_api/state/news.dart';
import 'package:news_api/widget/category_list.dart';
import 'package:news_api/widget/news_list.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
            Text(
              'News',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        backgroundColor: Color(0xffffffff),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // await Future.delayed(Duration(seconds: 3));
          await context.read<News>().fetchData(null);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [CategoryList(), NewsList()],
          ),
        ),
      ),
    );
  }
}
