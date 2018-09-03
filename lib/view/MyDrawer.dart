import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyDrawerState();
  }
}

class MyDrawerState extends State{
  
    @override
    Widget build( BuildContext context){
       return new Center(
         child : new Text("抽屉")
       );
    }
}
