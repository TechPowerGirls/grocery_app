import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          VxBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                " Delivery Address".text.semiBold.make().centered().p4(),
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
            children: [
              Icon(
                FontAwesomeIcons.user,
                color: Colors.red,
                size: 15,
              ),
              10.widthBox,
              Expanded(
                child: VxBox(child: "Name".text.make()).make(),
              ),
            ],
          ).p8(),
          5.heightBox,
          Row(
            children: [
              VxBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      FontAwesomeIcons.city,
                      color: Colors.red,
                      size: 15,
                    ),
                    10.widthBox,
                    VxBox(child: "city".text.make()).width(150).make(),
                  ],
                ).p8(),
              ).make(),
            ],
          ),
          5.heightBox,
        ],
      ),
    ).p4();
  }
}
