import 'package:flutter/material.dart';
import 'package:newsapi/models/all-news-model.dart';
import 'package:newsapi/pages/top-news.dart';

import 'package:newsapi/services/api.dart';

class AllNews extends StatefulWidget {
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  Future<AllNewsModel> allNewsModel;

  @override
    void initState() {
      super.initState();
      allNewsModel = fetchAllNews();
    }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: FutureBuilder<AllNewsModel>(
        future: allNewsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return cardView(snapshot.data.articles);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}