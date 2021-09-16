import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/provider/news.dart';

import '../news_detail.dart';

InkWell newsCard(BuildContext context, int index, News news) {
  return InkWell(
    customBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    onTap: () {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => NewsDetail(
            link: news.dataList[index].url,
          ),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(20.00)),
            child: Image.network(news.dataList[index].urlToImage),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.89,
            child: Column(
              children: [
                Text(
                  news.dataList[index].title.substring(0, 50),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10,),
                Text(news.dataList[index].description),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
