import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{

@override
 State<StatefulWidget> createState(){
    return new HomePageState();      
 }
}

class HomePageState extends State{
    
    @override
    Widget build( BuildContext context){
        return new Center(
          child:new Text("home")
        );
    }
 }