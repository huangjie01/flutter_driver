import 'package:flutter/material.dart';
import 'package:driver/model/MovieModel.dart';
import 'dart:convert';

 class MovieDetailPage extends StatefulWidget {
  MovieModel movie;
   MovieDetailPage({this.movie});
  @override
  State createState() => new MovieDetailState(movie:this.movie);
}

class MovieDetailState extends State {
   MovieModel movie;
  MovieDetailState({
    this.movie,
     //println(movie)
    });
  @override
  Widget build(BuildContext context) {
    return new Container(
      color:Colors.white,
      child: new Scaffold(
        appBar:  new AppBar(
          iconTheme: new IconThemeData(color: Colors.white),
          title: new Text(movie.name,
          style: new TextStyle(color:Colors.white),
          ),
        ),
        body: new SingleChildScrollView(
          child:new Column(
            children: <Widget>[

            ],
          )
        ),
      )
    );
  }
}
