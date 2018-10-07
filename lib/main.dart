import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'view/HomePage.dart';
import 'view/MoviePage.dart';
import 'view/WelfarePage.dart';
import 'view/InformationPage.dart';
import 'view/MyDrawer.dart';

void main() => runApp(new DriverClient());

class DriverClient extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => new DriverState();

}

class DriverState extends State<DriverClient> {
  var _tabImageList;
  IndexedStack _pageList;
  int _currentIndex = 0;

  var _tabTitleList = ['首页', '福利', '电影', '动态'];
 
  final TextStyle tabTextNormalStyle =
      new TextStyle(color: const Color(0xff969696));
  final TextStyle tabTextSelectStyle =
      new TextStyle(color: const Color(0xff5cc97c));

   void initState() { 
     super.initState();
   }
   
  @override
  Widget build(BuildContext context) {
    initView();
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: const Color(0xff5cc97c),
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_tabTitleList[_currentIndex],
              style: new TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white),
          actions: <Widget>[
            new IconButton(icon:new Icon(Icons.search,color: Colors.white,))
          ],
        ),
        body: _pageList,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: getTabIcon(0),
              title: getTabTitle(0),
            ),
            new BottomNavigationBarItem(
              icon: getTabIcon(1),
              title: getTabTitle(1),
            ),
            new BottomNavigationBarItem(
              icon: getTabIcon(2),
              title: getTabTitle(2),
            ),
            new BottomNavigationBarItem(
              icon: getTabIcon(3),
              title: getTabTitle(3),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        drawer: new MyDrawer(),
      ),
    );
  }

  /*
  * 根据路径返回tab 指示器图标
  */
  Image getTabImage(path) {
    return Image.asset(path, width: 23.0, height: 23.0);
  }

  /**
   * 根据位置，返回tab 图标
   */
  Image getTabIcon(index) {
    if (index == _currentIndex) {
      return _tabImageList[index][1];
    } else {
      return _tabImageList[index][0];
    }
  }

/*
 * 根据位置，返回tab 指示器title
 */
  Text getTabTitle(index) {
    return new Text(
      _tabTitleList[index],
       style: getTabTextStyle(index),
    );
  }

  /*
   * 根据位置，返回text Style
   */
  TextStyle getTabTextStyle(index) {
    if (index == _currentIndex) {
      return tabTextSelectStyle;
    } else {
      return tabTextNormalStyle;
    }
  }

/**
 * 初始化View
 */
  void initView() {
    if (_tabImageList == null) {
      _tabImageList = [
        [
          getTabImage('images/home_normal.png'),
          getTabImage('images/home_select.png')
        ],
        [
          getTabImage('images/welfare_normal.png'),
          getTabImage('images/welfare_select.png')
        ],
        [
          getTabImage('images/movie_normal.png'),
          getTabImage('images/movie_select.png')
        ],
        [
          getTabImage('images/information_normal.png'),
          getTabImage('images/information_select.png')
        ]
      ];
    }
      _pageList = new IndexedStack(
        children: <Widget>[
          new HomePage(),
          new WelfarePage(),
          new MoviePage(),
          new InformationPage()
        ],
        index: _currentIndex,
      );
    }
  }
