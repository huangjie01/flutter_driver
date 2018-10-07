import 'package:flutter/material.dart';
import 'dart:async';
import 'package:driver/api/HttpApi.dart';
import 'package:driver/utils/HttpUtils.dart';
import 'package:driver/view/MovieDetailPage.dart';
import 'package:driver/model/LastedMovieModel.dart';
import 'package:driver/model/MovieModel.dart';
import 'dart:convert';
import 'dart:async';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MovieState();
  }
}

class MovieState extends State {
  List<MovieModel> _dataList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_dataList == null || _dataList.length == 0) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (BuildContext context, index) => buildItem(index),
      );
      return new RefreshIndicator(child: listView, onRefresh: _refreash);
    }
  }

  /*
  *刷新数据 
  */
  Future<Null> _refreash() async {
    loadData();
    return null;
  }

  buildItem(index) {
    String directorName;
    StringBuffer costStringBuffer = new StringBuffer();
    String costString;

    //导演
    if (_dataList[index].directors!= null && _dataList[index].directors.length > 0) {
      directorName = _dataList[index].directors[0].name;
    }

    //主演
    int length = _dataList[index].casts.length;
    if (length > 0) {
      for (int i = 0; i < length; i++) {
        costStringBuffer.write(_dataList[index].casts[i].name + '/');
      }
      costString = costStringBuffer.toString();
      costString = costString.substring(0, costString.length - 1);
    }
    //类型
    List typeList = _dataList[index].type;
    int typeLength = typeList.length;
    StringBuffer typeBuffer = new StringBuffer();
    String type;

    for (int i = 0; i < typeLength; i++) {
      typeBuffer.write(typeList[i] + '/');
    }

    type = typeBuffer.toString();
    type = type.substring(0, type.length - 1);

    return new GestureDetector(
      child: new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new Container(
          padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
          child: new Row(children: <Widget>[
            new Image.network(
              _dataList[index].images.small,
              width: 80.0,
              height: 120.0,
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      _dataList[index].name,
                      textAlign: TextAlign.left,
                    ),
                    new Row(children: <Widget>[
                      new Text(
                        '导演:',
                        textAlign: TextAlign.left,
                      ),
                      new Text(directorName)
                    ]),
                    new Row(children: <Widget>[
                      new Text(
                        '主演:',
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        costString,
                        overflow: TextOverflow.ellipsis,
                      )
                    ]),
                    new Row(children: <Widget>[
                      new Text(
                        '类型:',
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        type,
                        overflow: TextOverflow.ellipsis,
                      )
                    ]),
                    new Row(children: <Widget>[
                      new Text(
                        '评分:',
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        _dataList[index].rating.average.toString(),
                        overflow: TextOverflow.ellipsis,
                      )
                    ]),
                  ]),
            )
          ]),
        )),
        onTap: ()=>goMovieDetal(index),
        );
  }

  void  goMovieDetal(index){
       Navigator.of(context).push(new MaterialPageRoute(
         builder: ( BuildContext context){
           return new MovieDetailPage(movie:_dataList[index]);
         },
       ));
  }

/*
 * 加载数据
 */

  loadData() {
    String url = HttpApi.movieUrl;
    HttpUtils.get(url, (data) {
      if (data != null) {
         LastedMovieModel lastedMovieModel=new LastedMovieModel(data);
        print(lastedMovieModel);
        List result = lastedMovieModel.movieModelList;
        setState(() {
          _dataList = result;
        });
       // print(result);
      }
    }, (error) {
      print(error);
    }, null);
  }
}
