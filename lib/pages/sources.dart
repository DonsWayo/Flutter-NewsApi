import 'package:flutter/material.dart';
import 'package:newsapi/models/sources-model.dart';
import 'package:newsapi/services/api.dart';

class Sources extends StatefulWidget {
  _SourcesState createState() => _SourcesState();
}

class _SourcesState extends State<Sources> {
  Future<SourcesModel> sources;

  @override
    void initState() {
      super.initState();
      sources = fetchSources();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: FutureBuilder<SourcesModel>(
        future: sources,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.sources.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('${snapshot.data.sources[index].name}'),
                        subtitle: Text('${snapshot.data.sources[index].description}'),
                      )
                    ],
                  ), 
                );
              },
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