import 'package:flutter/material.dart';


class InformationPage extends StatefulWidget{

@override
 State<StatefulWidget> createState(){
     return new InformationPageState();
 }

}

class InformationPageState extends State{
  @override
    Widget build( BuildContext context){
        return new Center(
          child:new Text("Information")
        );
    }
}