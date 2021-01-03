import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/home/category.dart';
import 'package:groceryapp/widgets/home/latestDeal.dart';
import 'package:groceryapp/widgets/home/slider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Serach_Main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Ref = Firestore.instance.collection("Category");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchMain(),
                  ));
            },
          ),
        ],
        title: Text("Grocery Shop"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Category(),
          slider(),
          //"Category All".text.xl.bold.make().p12(),//slider widget

          "Latest Deal".text.xl.bold.make().p12(),
          LatestDeal(),
        ],
      ).scrollVertical(),
    );
  }
}
