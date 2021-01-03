import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail Page"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      bottomSheet: Container(
        child: Row(
          children: [
            Expanded(
                child:
                    VxBox(child: "Buy Now".text.bold.xl.white.make().centered())
                        .red600
                        .height(context.isLandscape
                            ? context.percentHeight * 15
                            : context.percentHeight * 8)
                        .make()),
            Expanded(
                child: VxBox(
                        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "Add to Cart".text.bold.xl.red600.make().centered(),
                Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ],
            ))
                    .height(context.isLandscape
                        ? context.percentHeight * 15
                        : context.percentHeight * 8)
                    .make()
                    .box
                    .shadowXs
                    .make())
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: VxResponsive(
              small: Content().h(context.percentHeight * 60),
              fallback: Content(),
            ),
          ),
        ],
      ),
    );
  }
}

class CartAddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            VxBox(
                    child: Icon(
              Icons.add,
              color: Colors.white,
            ).p12())
                .red600
                .roundedSM
                .make(),
            VxBox(child: "2".text.xl2.bold.make().p12()).roundedSM.make(),
            VxBox(
                    child: Icon(
              Icons.add,
              color: Colors.white,
            ).p12())
                .red600
                .roundedSM
                .make(),
          ],
        ).pOnly(left: context.isLandscape ? 140 : 130),
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            VxBox(
              child: Card(
                  child: Stack(
                children: <Widget>[
                  Image.network(
                    "https://thediplomat.com/wp-content/uploads/2016/04/sizes/td-story-s-1/thediplomat_2016-04-26_19-22-13.jpg",
                    height: context.isMobile
                        ? context.screenHeight * 0.2
                        : context.screenHeight * 0.4,
                  ).centered(),
                  "Rs.30".text.xl2.bold.make().centered().pOnly(
                        top: 180,
                      ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          "1000G".text.make().p12().box.gray300.make(),
                          VxRating(
                            onRatingUpdate: (value) {},
                            count: 4,
                            selectionColor: Colors.deepOrangeAccent,
                            size: context.isLandscape ? 20 : 20,
                          ).p8(),
                        ],
                      ),
                    ],
                  ),
                ],
              )).px16(),
            )
                .size(
                    context.isLandscape
                        ? context.percentWidth * 50
                        : context.screenWidth,
                    context.isLandscape
                        ? context.percentHeight * 65
                        : context.percentHeight * 30)
                .roundedSM
                .make(),
            ProductInfo().pOnly(
                top: context.isLandscape ? 0 : 250,
                left: context.isLandscape ? 380 : 0)
          ],
        ),
      ],
    );
  }
}

class ProductInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          20.heightBox,
          "Alphanso Mango".text.xl2.bold.make(),
          "They have a rich, creamy, tender texture and delicate, non-fibrous, juicy pulp. The skin of a fully ripe Alphonso mango turns bright golden-yellow with a tinge of red which spreads across the top of the fruit. The flesh of the fruit is saffron-colored. These characteristics make Alphonso a favored cultivar."
              .text
              .gray600
              .make()
              .p16(),
          "Quantity"
              .text
              .xl
              .gray600
              .makeCentered()
              .pOnly(top: context.isLandscape ? 0 : 0),
          20.heightBox,
          CartAddButton()
        ],
      ),
    );
  }
}
