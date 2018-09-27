import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
            body: new GestureDetector(
              child: new Image.network(
                url,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              onLongPress: () => showAction(),
            )));
  }

  void showActionSheet<T>({BuildContext context, Widget child}) {
    showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {});
  }

  showAction() {
    showActionSheet<String>(
      context: context,
      child: new CupertinoActionSheet(
          actions: <Widget>[
            new CupertinoActionSheetAction(
              child: const Text('下载'),
              onPressed: () {},
            ),
            new CupertinoActionSheetAction(
              child: const Text('保存到系统相册'),
              onPressed: () {},
            ),
          ],
          cancelButton: new CupertinoActionSheetAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
          )),
    );
  }
}
