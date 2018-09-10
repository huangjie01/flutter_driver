import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyDrawerState();
  }
}

class MyDrawerState extends State {
  var titleList = ['消息', '换肤', '设置', '关于'];
  var iconList = [
    'images/information_select.png',
    'images/skin.png',
    'images/set.png',
    'images/about.png'
  ];
  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
        constraints: const BoxConstraints.expand(width: 304.0),
        child: new Material(
          elevation: 8.0,
          child: new Container(
            decoration: new BoxDecoration(
              color: const Color(0xFFFFFFFF),
            ),
            child: new ListView.builder(
              itemCount: titleList.length * 2,
              itemBuilder: (BuildContext context, index) => buildItem(index),
            ),
          ),
        ));
  }

/*
 *  
 */
  Widget buildItem(index) {
    if (index == 0) {
      return new Container(
          height: 180.0,
          width: 304.0,
          color: const Color(0xff5cc97c),
          padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 0.0),
          child: new Center(
              child: new Column(children: <Widget>[
            new ClipOval(
                child: new Image.asset(
              'images/avatar.jpg',
              width: 80.0,
              height: 80.0,
            )),
            new Text(
              '窃.格瓦拉',
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            new Text(
              '一位伟大的无产阶级革命家,思想家',
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ])));
    } else {
      index = index - 1;
      if (index.isOdd) {
        return new Divider();
      }
      index = index ~/ 2;
      return new Container(
          margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          height: 40.0,
          child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  iconList[index],
                  width: 20.0,
                  height: 20.0,
                ),
                new Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 180.0, 0.0),
                    child: new Center(
                        child: new Text(
                      titleList[index],
                      style: TextStyle(color: const Color(0xff969696),fontSize: 16.0),
                    ))),
                new Image.asset(
                  'images/next.png',
                  width: 12.0,
                  height: 12.0,
                )
              ]));
    }
  }
}
