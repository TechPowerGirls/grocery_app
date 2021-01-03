import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/pages/ProductListingPage.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:groceryapp/pages/CategoryPage.dart';

class SubCategory extends StatefulWidget {
  final catname;

  SubCategory(this.catname);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  final catRef = Firestore.instance.collection("Category");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: catRef.where("catName", isEqualTo: widget.catname).snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List SubCatList = [];
            SubCatList = snapshot.data.documents[0].data['subcatName'];
            print("SubCatelist" + SubCatList.toString());
            return Container(
                height: context.isLandscape ? 70 : 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: SubCatList.length,
                  itemBuilder: (contex, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductListing(SubCatList[index]),
                            ));
                      },
                      child: VxBox(
                              child:
                                  /*Icon(
                    Icons.home,
                    color: Colors.white,
                  ),*/
                                  Text(
                        SubCatList[index],
                        style: TextStyle(fontSize: 15, color: Colors.white),
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
