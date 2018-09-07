import 'package:flutter/material.dart';
import 'package:driver/api/HttpApi.dart';
import 'package:driver/utils/HttpUtils.dart';
import 'dart:convert';
import 'dart:async';

class WelfarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WelfarePageState();
  }
}

class WelfarePageState extends State {
  num _currentPage = 0;
  List _dataList = new List();
  ScrollController _scrollController = new ScrollController();

  WelfarePageState() {
    _scrollController.addListener(() {
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixel = _scrollController.position.pixels;
      if (pixel >= maxScroll) {
        print('loadMore Data');
        _currentPage++;
        loadData(true);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if (_dataList == null || _dataList.length == 0) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView= new ListView.builder(
        itemBuilder: (context, index) => buidlItem(index),
        itemCount: _dataList.length,
        controller: _scrollController,
      );
      return new RefreshIndicator(child: listView,onRefresh: _refreshData);
    }
  }

  @override
  void initState() {
    super.initState();
    loadData(false);
  }

/*
 * 构建ListView item 对象
 */
  Widget buidlItem(index) {
    return new Container(
      padding: const EdgeInsets.all(4.0),
      child: new Card(
        elevation: 2.0,
        child: new Image.network(
          _dataList[index],
        ),
      ),
    );
  }

   /*
    * 刷新数据
    */
Future<Null> _refreshData() async{
    loadData(false);
    return null;
  }

/*
 * 加载数据
 */
  loadData(bool loadMore) {
    String url = HttpApi.WelfareUrl + '/$_currentPage';
    HttpUtils.get(url, (data) {
      if (data != null) {
        Map<String, dynamic> resultMap = json.decode(data);
        //print(resultMap);
        List result = resultMap['results'];
        List urlList = new List();
        for (int i = 0; i < result.length; i++) {
          urlList.add(result[i]['url']);
        }
        setState(() {
          if (loadMore) {
            _dataList.addAll(urlList);
          } else {
            _dataList = urlList;
          }
        });
      }
    }, (error) {
      print(error);
    }, null);
  }
}
