import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Grocery Store"),
      ),
      body: VStack([
        "Hello"
            .selectableText
            .make()
            .box
            .p8
            .rounded
            .red400
            .alignCenter
            //.withConstraints(const BoxConstraints(maxWidth: 100, minWidth: 50))
            .make(),
        10.heightBox,
        "Welcome to VelocityX".text.maxLines(4).semiBold.blue500.make(),
        10.heightBox,
        "${context.isMobile ? 'We are on mobile' : 'We are on Web'}"
            .text
            .bold
            .white
            .size(context.isMobile ? 20 : 40)
            .center
            .make()
            .animatedBox
            .width(!context.isMobile
                ? context.screenWidth
                : context.percentWidth * 50)
            .height(context.percentHeight * 20)
            .rounded
            .p8
            .alignCenter
            .shadow2xl
            .linearGradient([Vx.teal400, Vx.indigo400]).makeCentered(),
        20.heightBox,
        [
          "Item 1"
              .text
              .white
              .make()
              .shimmer()
              .box
              .rounded
              .alignCenter
              .black
              .make()
              .p4(),
          "Item 2".text.make().box.rounded.alignCenter.green500.make().p4(),
          "Item 3".text.make().box.rounded.alignCenter.blue500.make().p4(),
          "Item 4".text.make().box.rounded.alignCenter.red500.make().p4(),
          "Item 5".text.make().box.rounded.alignCenter.orange500.make().p4(),
          "Item 6".text.make().box.rounded.alignCenter.pink500.make().p4(),
        ].swiper(
            height: context.isMobile ? 400 : 400,
            enlargeCenterPage: true,
            scrollDirection:
                context.isMobile ? Axis.horizontal : Axis.vertical),
        20.heightBox,
        const VxDevice(mobile: Text("Hi Mobile"), web: Text("Hi Web")),
        const VxResponsive(
          xsmall: Text("Hi Extra Small"),
          small: Text("Hi Small"),
          medium: Text("Hi Medium"),
          large: Text("Hi Large"),
          xlarge: Text("Hi Extra Large"),
          fallback: Text("Hi Nothing Specified"),
        ),
        "Card Sample".text.makeCentered().card.red700.make().h10(context),
        20.heightBox,
        "abc".text.make(),

        10.heightBox,
        //"https://avatars0.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4"
        //  ,
        10.heightBox,

        10.heightBox,

        10.heightBox,
        Container(
          child: const Icon(Icons.menu),
          padding: Vx.m20,
        ),
        20.heightBox,
        "Neumorphic"
            .text
            .bold
            .make()
            .box
            .alignCenter
            .width(200)
            .height(200)
            .roundedLg
            .neumorphic(color: Colors.white, curve: VxCurve.flat)
            .make(),
        20.widthBox,
        const VxDiscList(
          ["Disc Item 1", "Disc Item 2"],
          primary: false,
        ),
        const VxDecimalList(
          ["Decimal Item 1", "Decimal Item 2"],
          primary: false,
        ),
        ["Item 1", "Item 2", "Item 3"]
            .textDropDown(
              selectedValue: "Item 1",
              onChanged: (value) {
                Vx.log(value);
              },
            )
            .make(),
      ]).p16().scrollVertical(),
    );
  }
}
