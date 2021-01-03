import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/home/category.dart';
import 'package:groceryapp/widgets/home/latestDeal.dart';
import 'package:groceryapp/widgets/home/slider.dart';
import 'package:groceryapp/widgets/listingpage/productcard.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductListing extends StatefulWidget {
  final subcatname;

  const ProductListing(this.subcatname);

  @override
  _ProductListingState createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  final catRef = Firestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Listing Page"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Category(),

          //"Category All".text.xl.bold.make().p12(),//slider widget

          ProductGrid(widget.subcatname)
        ],
      ).scrollVertical(),
    );
  }
}
