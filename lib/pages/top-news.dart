import 'package:flutter/material.dart';
import 'package:newsapi/models/top.dart';
import 'package:newsapi/services/api.dart';

class TopNews extends StatefulWidget {
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  Future<Top> top;

  Future<void> _refresh() async
  {
    setState(() {
          top = fetchPost();
          _showToast(context);
    });
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Up to date 🎉 !!!')));
  }

  @override
  void initState() {
    super.initState();
    top = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Top>(
        future: top,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: RefreshIndicator(
                child: cardView(snapshot.data.articles),
                onRefresh: _refresh,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return LinearProgressIndicator();
        },
      ),
      
    );
  }
}

Widget cardView(data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      return Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network('${data[index].urlToImage}'),
              Divider(),
              Padding(
                child: Text('${data[index].title}'),
                padding: EdgeInsets.all(10),
              ),
              Divider()
            ],
          ),
        ),
      );
    },
  );
}
