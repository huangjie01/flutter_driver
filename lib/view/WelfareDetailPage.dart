import 'package:flutter/material.dart';

class WelfareDetailPage extends StatefulWidget {
  var url;
  List dataList;
  WelfareDetailPage({this.url, this.dataList});
  State<StatefulWidget> createState() =>
      new WelfareDetailState(url: this.url, dataList: dataList);
}

class WelfareDetailState extends State<WelfareDetailPage> {
  var url;
  List dataList;
  Widget listView;
  WelfareDetailState({this.url, this.dataList});
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: new Scaffold(
            appBar: new AppBar(
              iconTheme: new IconThemeData(color: Colors.white),
              title: new Text(
                '福利详情',
                style: new TextStyle(color: Colors.white),
              ),
            ),
            body: listView = new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildItem(index),
            )));
  }

  Widget buildItem(index) {
    return new GestureDetector(
      child: new Image.network(
        dataList[index],
        height: double.infinity,
        fit: BoxFit.cover,
      ),
      onLongPress: () => showAction(index),
    );
  }

  showAction(index) {
    
  }
}
