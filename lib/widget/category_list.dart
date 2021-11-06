import 'package:flutter/material.dart';
import 'package:news_api/models/category.dart';
import 'package:news_api/state/news.dart';
import 'package:provider/src/provider.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await context.read<News>().fetchData(
                    categories[index],
                  );
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
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
