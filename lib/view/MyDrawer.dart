import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyDrawerState();
  }
}

class MyDrawerState extends State {
  var titleList = ['消息', '关于', '设置'];
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
        height: 304.0,
        width: 304.0,
      );
    } else {
      index = index - 1;
      if (index.isOdd) {
        return new Divider();
      }
      index = index ~/ 2;
      return new ListTile(
        title: new Text(titleList[index]),
      );
    }
  }
}
