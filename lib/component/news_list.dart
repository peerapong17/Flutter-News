import 'package:flutter/material.dart';
import 'package:news_api/provider/news.dart';

import 'new_card.dart';

Expanded newsList({required News news}) {
    return Expanded(
      child: FutureBuilder<String>(
        future: news.fetchDatas(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            height: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: news.dataList.length,
              itemBuilder: (context, index) {
                return newsCard(context, index, news);
              },
            ),
          );
        },
      ),
    );
  }