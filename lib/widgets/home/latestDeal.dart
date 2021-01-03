import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/pages/ProductListingPage.dart';
import 'package:groceryapp/pages/ProductdetailPage.dart';
import 'package:groceryapp/pages/detail.dart';
import 'package:groceryapp/pages/detailPage.dart';
import 'package:velocity_x/velocity_x.dart';

class LatestDeal extends StatefulWidget {
  @override
  _LatestDealState createState() => _LatestDealState();
}

class _LatestDealState extends State<LatestDeal> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: context.isMobile ? 2 : 3,
      children: <Widget>[
        InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(
            //  builder: (_)=>ProductListing()
            //  ));
          },
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DetailPage()));
            },
            child: Card(
                child: Stack(
              children: <Widget>[
                Image.network(
                  "https://thediplomat.com/wp-content/uploads/2016/04/sizes/td-story-s-1/thediplomat_2016-04-26_19-22-13.jpg",
                  height: context.isMobile
                      ? context.screenHeight * 0.1
                      : context.screenHeight * 0.3,
                ).centered(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        "1000G".text.make().p12().box.gray300.make(),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 25,
                        )
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              "mango"
                                  .text
                                  .size(context.isLandscape ? 25 : 18)
                                  .gray600
                                  .semiBold
                                  .make(),
                              //.pOnly(left: 10,top: context.isLandscape?context.percentHeight * 40:context.percentHeight * 16),
                              "Rs.40.00"
                                  .text
                                  .size(context.isLandscape ? 19 : 15)
                                  .bold
                                  .make(),
                            ],
                          ).pOnly(left: 10),
                          // 3.to(10).toString().text.make(),
                          // Text("They have a rich, creamy, tender texture and delicate, non-fibrous, juicy pulp. The skin of a fully ripe Alphonso mango turns bright golden-yellow with a tinge of red which spreads across the top of the fruit. The flesh of the fruit is saffron-colored."),

                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          )
                              .box
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
          ),
        ),

        /* InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (_)=>ProductDetailPage()
            ));

          },
          child: Card(
              child: Stack(
                children: <Widget>[

                  Image.network("https://thediplomat.com/wp-content/uploads/2016/04/sizes/td-story-s-1/thediplomat_2016-04-26_19-22-13.jpg",height: context.isMobile? context.screenHeight*0.1:context.screenHeight*0.3,).centered(),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          "1000G".text.make().p12().box.gray300.make(),
                          Icon(
                            Icons.favorite, color: Colors.red,
                            size: 25,)
                        ],
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                "mango".text.size(context.isLandscape ? 25 : 18).gray600.semiBold.make(),
                                    //.pOnly(left: 10,top: context.isLandscape?context.percentHeight * 40:context.percentHeight * 16),
                                "Rs.40.00".text.size(context.isLandscape ? 19 : 15).bold.make(),

                              ],
                            ).pOnly(left: 10),
                            VxBox(


                                child:
                                Icon(
                                  Icons.add, color: Colors.white,
                                  size: 20,)
                            ).red700.roundedSM
                                //.p8.make(),
                                .height(context.isMobile?context.percentHeight*4:context.percentHeight*9).width(context.isMobile?context.percentWidth*7:context.percentWidth*6).make()


                          ],

                        ),
                      ),

                    ],
                  ),


                ],
              )
          ).p12(),
        ),*/
        Card(
            child: Stack(
          children: <Widget>[
            Image.network(
              "https://thediplomat.com/wp-content/uploads/2016/04/sizes/td-story-s-1/thediplomat_2016-04-26_19-22-13.jpg",
              height: context.isMobile
                  ? context.screenHeight * 0.1
                  : context.screenHeight * 0.3,
            ).centered(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    "1000G".text.make().p12().box.gray300.make(),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    )
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          "mango"
                              .text
                              .size(context.isLandscape ? 25 : 18)
                              .gray600
                              .semiBold
                              .make(),
                          //.pOnly(left: 10,top: context.isLandscape?context.percentHeight * 40:context.percentHeight * 16),
                          "Rs.40.00"
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
        Card(
            child: Stack(
          children: <Widget>[
            Image.network(
              "https://thediplomat.com/wp-content/uploads/2016/04/sizes/td-story-s-1/thediplomat_2016-04-26_19-22-13.jpg",
              height: context.isMobile
                  ? context.screenHeight * 0.1
                  : context.screenHeight * 0.3,
            ).centered(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    "1000G".text.make().p12().box.gray300.make(),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    )
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          "mango"
                              .text
                              .size(context.isLandscape ? 25 : 18)
                              .gray600
                              .semiBold
                              .make(),
                          //.pOnly(left: 10,top: context.isLandscape?context.percentHeight * 40:context.percentHeight * 16),
                          "Rs.40.00"
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
      ],
    );
  }
}
