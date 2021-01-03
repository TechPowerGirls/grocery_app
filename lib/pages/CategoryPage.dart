import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/home/category.dart';
import 'package:groceryapp/widgets/home/latestDeal.dart';
import 'package:groceryapp/widgets/home/slider.dart';
import 'package:groceryapp/widgets/home/subcategory_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryPage extends StatefulWidget {
  final catename;

  CategoryPage(this.catename); // variable passing from category widget

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("category page"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SubCategory(widget.catename),

          //"Category All".text.xl.bold.make().p12(),//slider widget

          "Latest Deal".text.xl.bold.make().p12(),
          LatestDeal(),
        ],
      ).scrollVertical(),
    );
  }
}
