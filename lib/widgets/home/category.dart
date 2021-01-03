import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/pages/ProductListingPage.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:groceryapp/pages/CategoryPage.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final catRef = Firestore.instance.collection("Category");
  List categoryIcons = [
    Icon(
      Icons.add_shopping_cart,
      color: Colors.white,
    ),
    Icon(
      Icons.local_drink,
      color: Colors.white,
    ),
    Icon(
      Icons.local_drink,
      color: Colors.white,
    ),
    Icon(
      Icons.local_drink,
      color: Colors.white,
    ),
    Icon(
      Icons.local_drink,
      color: Colors.white,
    ),
    Icon(
      Icons.local_drink,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: catRef.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Container(
                height: context.isLandscape ? 70 : 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (contex, index) {
                    var catname =
                        snapshot.data.documents[index].data['catName'];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CategoryPage(catname),
                            ));
                      },
                      child: VxBox(
                              child:
                                  /*Icon(
                    Icons.home,
                    color: Colors.white,
                  ),*/
                                  Text(
                        catname,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ).centered()
                              // categoryIcons[index].text.xl2.make().box.make().centered()
                              )
                          .width(context.isLandscape ? 120 : 80)
                          .red600
                          .roundedSM
                          .make()
                          .p12(),
                    );
                  },
                )).pOnly(top: 10);
          } else {
            return Text('loading');
          }
        });
  }
}
