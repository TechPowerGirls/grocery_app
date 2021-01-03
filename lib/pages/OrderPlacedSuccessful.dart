import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/orderpage/OrderDetails.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Home.dart';
import 'HomePge.dart';

class OrderSuccesful extends StatefulWidget {
  @override
  _OrderSuccesfulState createState() => _OrderSuccesfulState();
}

class _OrderSuccesfulState extends State<OrderSuccesful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Payment Transaction Confirm"),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                VxBox(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Shopper Name".text.semiBold.make().centered().p4(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VxBox(child: "Thanks for Shopping With us".text.make())
                        .make(),
                  ],
                ).p8(),
              ],
            ),
          ).p4(),
          OrderDetailPage(),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Home()));
            },
            child: VxBox(
              child: Center(
                  child: Text(
                "continue with Shopping",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
            ).red600.roundedSM.height(30).p4.make(),
          )
        ],
      ),
    );
  }
}
