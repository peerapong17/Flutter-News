import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_api/provider/news.dart';
import 'package:provider/provider.dart';
import './models/categories.dart';
import 'component/news_list.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Provider<News>(
      create: (context) => News(),
      child: Scaffold(
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
        body: Consumer<News>(
          builder: (context, news, child) => RefreshIndicator(
            onRefresh: () async {
              news.dataList.clear();
              await Future.delayed(Duration(seconds: 3));
              await news.fetchDatas();
              setState(() {});
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: (Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            news.dataList.clear();
                            await news.fetchDatasByGategory(categories[index]);
                            setState(() {});
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.blueAccent.withOpacity(0.9),
                            margin: EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  newsList(news: news),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
