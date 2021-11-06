import 'package:flutter/material.dart';
import 'package:news_api/state/news.dart';
import 'package:provider/provider.dart';

import 'new_card.dart';

class NewsList extends StatefulWidget {
  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<String>(
        future: context.read<News>().fetchData(null),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          print(snapshot);
          if (context.watch<News>().dataList.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Ooops An error occured!'),
                  content: const Text('Something went wrong'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
              return Center(
                child: Row(
                  children: [
                    Text("Cannot fetch data"),
                    ElevatedButton(
                      onPressed: () async {
                        await context.read<News>().fetchData(null);
                      },
                      child: Text("Try Again"),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: context.watch<News>().dataList.length,
                itemBuilder: (context, index) {
                  var newsData = context.watch<News>().dataList[index];
                  return newsCard(context, newsData);
                },
              );
            }
          }
        },
      ),
    );
  }
}
