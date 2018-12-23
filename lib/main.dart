import 'package:flutter/material.dart';
import 'package:newsapi/Pages/all-news.dart';
import 'package:newsapi/Pages/top-news.dart';
import 'package:newsapi/pages/sources.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  int _currentIndex = 0;

  Widget callPage(int currentIndex){
    switch (currentIndex) {
      case 0: return TopNews();
      case 1: return AllNews();
      case 2: return Sources();
        
        break;
      default:
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'News API',
       home: Scaffold(
         appBar: AppBar(
           title: Text('News API'),
         ),
         body: callPage(_currentIndex),
         bottomNavigationBar: BottomNavigationBar(
           currentIndex: _currentIndex,
           onTap: (value){    
             setState(() {
              _currentIndex = value;
            });
           },
           items: [
             BottomNavigationBarItem(
               icon: Icon(Icons.fiber_new),
               title: Text('Trending')
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.stay_current_portrait),
               title: Text('Flutter')
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.surround_sound),
               title: Text('Sources')
             )
           ],
         ),
       ),
    );
  }
}