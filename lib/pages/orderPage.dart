import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryapp/widgets/orderpage/DelivaryAddress.dart';
import 'package:groceryapp/widgets/orderpage/OrderDetails.dart';
import 'package:velocity_x/velocity_x.dart';

import 'SelectPayment.dart';
import 'StripeHomePage.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(" Order Page"),
      ),
      body: Column(
        children: [
          DeliveryAddress(),
          OrderDetailPage(),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => StripeHomePage()));
            },
            child: VxBox(
              child: Center(
                  child: Text(
                "Select your Payment",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
            ).red600.roundedSM.height(30).p4.make(),
          )
        ],
      ).scrollVertical(),
    );
  }
}
