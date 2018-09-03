import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MovieState();
  }
}

class MovieState extends State {
  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text("movie"));
  }
}
