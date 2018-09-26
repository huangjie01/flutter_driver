import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InformationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InformationPageState();
  }
}

class InformationPageState extends State with SingleTickerProviderStateMixin {
  // final List<Tab> tabList = <Tab>[
  //   new Tab(text: 'Android'),
  //   new Tab(text: 'iOS'),
  //   new Tab(text: '前端'),
  //   new Tab(text: '后端')
  // ];
  //TabController tabController;

  @override
  void initState() {
    super.initState();
   // tabController = new TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
   // tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:new Center(
        child: new CupertinoActivityIndicator()
      )
    );
  }
}
