import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailDemo extends StatefulWidget {
  @override
  _DetailDemoState createState() => _DetailDemoState();
}

class _DetailDemoState extends State<DetailDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Container(
        height:
            context.isLandscape ? context.screenHeight : context.screenHeight,
        child: Stack(
          children: [
            VxBox()
                .red700
                .size(
                    context.isLandscape
                        ? context.percentWidth * 40
                        : context.screenWidth,
                    context.isLandscape
                        ? context.screenHeight
                        : context.percentHeight * 50)
                .make(),
            Content()
                .w(context.isLandscape
                    ? context.screenWidth * 0.5
                    : context.screenWidth)
                .pOnly(
                    left: context.isLandscape ? context.percentWidth * 40 : 20),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.heightBox,
        "Alphanso Mango".text.xl2.bold.make(),
        "They have a rich, creamy, tender texture and delicate, non-fibrous, juicy pulp. The skin of a fully ripe Alphonso mango turns bright golden-yellow with a tinge of red which spreads across the top of the fruit. The flesh of the fruit is saffron-colored. These characteristics make Alphonso a favored cultivar."
            .text
            .gray600
            .make()
            .p16(),
        "Quantity".text.xl.gray600.makeCentered(),
        20.heightBox,
      ],
    );
  }
}
