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
    return new Drawer(
        child: new Column(
      children: <Widget>[
        new DrawerHeader(
          margin: const EdgeInsets.all(0.0),
          decoration: new BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: new Container(
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
              ]))),
        ),
        new Container(
            margin: const EdgeInsets.all(0.0),
            color: Theme.of(context).primaryColor,
            child: new Center(
                child: new Text('一位伟大的无产阶级思想家，教育家,',
                    style:
                        new TextStyle(color: Colors.white, fontSize: 18.0)))),
        new Container(
            height: 50.0,
            color: Colors.white,
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    iconList[0],
                    width: 20.0,
                    height: 20.0,
                  ),
                  new Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 180.0, 0.0),
                      child: new Center(
                          child: new Text(
                        titleList[0],
                        style: TextStyle(
                            color: const Color(0xff969696), fontSize: 16.0),
                      ))),
                  new Image.asset(
                    'images/next.png',
                    width: 12.0,
                    height: 12.0,
                  )
                ])),
        new Divider(
          height: 1.0,
        ),
        new Container(
            height: 50.0,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    iconList[1],
                    width: 20.0,
                    height: 20.0,
                  ),
                  new Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 180.0, 0.0),
                      child: new Center(
                          child: new Text(
                        titleList[1],
                        style: TextStyle(
                            color: const Color(0xff969696), fontSize: 16.0),
                      ))),
                  new Image.asset(
                    'images/next.png',
                    width: 12.0,
                    height: 12.0,
                  )
                ])),
        new Divider(
          height: 1.0,
        ),
        new Container(
            height: 50.0,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    iconList[2],
                    width: 20.0,
                    height: 20.0,
                  ),
                  new Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 180.0, 0.0),
                      child: new Center(
                          child: new Text(
                        titleList[2],
                        style: TextStyle(
                            color: const Color(0xff969696), fontSize: 16.0),
                      ))),
                  new Image.asset(
                    'images/next.png',
                    width: 12.0,
                    height: 12.0,
                  )
                ])),
        new Divider(
          height: 1.0,
        ),
        new Container(
            height: 50.0,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    iconList[3],
                    width: 20.0,
                    height: 20.0,
                  ),
                  new Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 180.0, 0.0),
                      child: new Center(
                          child: new Text(
                        titleList[3],
                        style: TextStyle(
                            color: const Color(0xff969696), fontSize: 16.0),
                      ))),
                  new Image.asset(
                    'images/next.png',
                    width: 12.0,
                    height: 12.0,
                  )
                ]))
      ],
    ));
  }

/*
 *  
 */
  Widget buildItem(index) {
    if (index == 0) {
      return new Container(
        height: 60.0,
        width: 280.0,
        color: Theme.of(context).primaryColor,
        child: new Text('一位伟大的无产阶级思想家，教育家',
            style: new TextStyle(color: Colors.white, fontSize: 16.0)),
      );
    }
    index = index - 1;
    if (index.isOdd) {
      return new Divider();
    }
    index = index ~/ 2;
    return new Container(
        //margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
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
                    style: TextStyle(
                        color: const Color(0xff969696), fontSize: 16.0),
                  ))),
              new Image.asset(
                'images/next.png',
                width: 12.0,
                height: 12.0,
              )
            ]));
  }
}
