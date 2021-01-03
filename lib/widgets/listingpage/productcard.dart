import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/model/product_model.dart';
import 'package:groceryapp/pages/ProductdetailPage.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductGrid extends StatefulWidget {
  final subcatname;

  ProductGrid(this.subcatname);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final prodRef = Firestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: prodRef
            .where("prodSubcategory", isEqualTo: widget.subcatname)
            .snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          {
            if (snapshot.hasData) {
              final p = snapshot.data.documents;
              List<Product> productList = [];
              p.forEach((element) {
                productList.add(Product.fromJson(element.data));
              });
              print(productList);
              return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: context.isLandscape ? 3 : 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetailPage(productList[index])));
                      },
                      child: Card(
                          child: Stack(
                        children: <Widget>[
                          Image.network(
                            productList[index].thumbImage,
                            height: context.isMobile
                                ? context.screenHeight * 0.1
                                : context.screenHeight * 0.3,
                          ).centered(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(productList[index].prodSize[0])
                                      .text
                                      .make()
                                      .p12()
                                      .box
                                      .gray300
                                      .make(),
                                  //productList[index].prodSize[0].text.make().p12().box.gray300.make(),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 25,
                                  )
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        productList[index]
                                            .prodName
                                            .text
                                            .size(context.isLandscape ? 25 : 18)
                                            .gray600
                                            .semiBold
                                            .make(),
                                        //.pOnly(left: 10,top: context.isLandscape?context.percentHeight * 40:context.percentHeight * 16),
                                        ("\$" + productList[index].prodPrice)
                                            .text
                                            .size(context.isLandscape ? 19 : 15)
                                            .bold
                                            .make(),
                                      ],
                                    ).pOnly(left: 10),
                                    VxBox(
                                            child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ))
                                        .red700
                                        .roundedSM
                                        //.p8.make(),
                                        .height(context.isMobile
                                            ? context.percentHeight * 4
                                            : context.percentHeight * 9)
                                        .width(context.isMobile
                                            ? context.percentWidth * 7
                                            : context.percentWidth * 6)
                                        .make()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )).p12(),
                    );
                  });
            } else {
              return Text('loading');
            }
          }
        });
  }
}
