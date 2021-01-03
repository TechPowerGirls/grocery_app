import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              VxBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    " Order Items".text.semiBold.make().centered().p4(),
                  ],
                ),
              )
                  .gray200
                  .height(30)
                  .width(context.percentHeight * 100)
                  .roundedSM
                  .make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VxBox(child: "Product Name".text.make()).make(),
                  VxBox(child: "20".text.red600.semiBold.make()).make(),
                ],
              ).p8(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VxBox(child: "Product Name".text.make()).make(),
                  VxBox(child: "20".text.red600.semiBold.make()).make(),
                ],
              ).p8(),
            ],
          ),
        ).p4(),
        Card(
          child: Column(
            children: [
              VxBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Order Details".text.semiBold.make().centered().p4(),
                  ],
                ),
              )
                  .gray200
                  .height(30)
                  .width(context.percentHeight * 100)
                  .roundedSM
                  .make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text("Cart total"), Text("\$${"20"}")],
              ).p8(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text("Discount"), Text("\$10")],
              ).p8(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text("Shipping Cost"), Text("Free")],
              ).p8(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                  ).text.red600.make(),
                  Text("\$${"20"}").text.red600.make(),
                ],
              ).p8(),
            ],
          ),
        ).p4(),
      ],
    );
  }
}
