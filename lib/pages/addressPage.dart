import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import 'orderPage.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  _buildTextField(TextEditingController controller, String labelText) {
    return VxBox(
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black, fontSize: 12),

            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    ).height(30).gray200.roundedSM.make();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Address"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    VxBox(
                            child: "Add New Address"
                                .text
                                .white
                                .semiBold
                                .makeCentered())
                        .gray600
                        .height(40)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.user,
                          color: Colors.red,
                          size: 15,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Container(
                            child: _buildTextField(nameController, "name"),
                          ),
                        ),
                      ],
                    ).p4(),
                    5.heightBox,
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.home,
                          color: Colors.red,
                          size: 15,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Container(
                            child: _buildTextField(
                                houseNumberController, "House Number"),
                          ),
                        ),
                      ],
                    ).p4(),
                    5.heightBox,
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.mobile,
                          color: Colors.red,
                          size: 15,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Container(
                            child: _buildTextField(
                                mobileController, "Mobile Number"),
                          ),
                        ),
                      ],
                    ).p4(),
                    5.heightBox,
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.houseUser,
                          color: Colors.red,
                          size: 15,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Container(
                            child:
                                _buildTextField(localityController, "Locality"),
                          ),
                        ),
                      ],
                    ).p4(),
                    5.heightBox,
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.city,
                          color: Colors.red,
                          size: 15,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Container(
                            child: _buildTextField(cityController, "City"),
                          ),
                        ),
                      ],
                    ).p4(),
                    5.heightBox,
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.mapMarked,
                          color: Colors.red,
                          size: 15,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Container(
                            child: _buildTextField(stateController, "state"),
                          ),
                        ),
                      ],
                    ).p4(),
                    5.heightBox,
                    Row(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: Colors.red,
                          size: 15,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Container(
                            child: _buildTextField(cityController, "zip code"),
                          ),
                        ),
                      ],
                    ).p4(),
                    20.heightBox,
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: VxBox(
                        child: Center(
                            child: Text(
                          "Add Address",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ).red600.roundedSM.height(30).p4.make(),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ), //Icon(Icons.chat),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => OrderPage()));
            },
            child: Card(
              child: Column(
                children: [
                  VxBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Select Delivery Address"
                            .text
                            .semiBold
                            .make()
                            .centered()
                            .p4(),
                        InkWell(onTap: () {}, child: Icon(Icons.clear)),
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
                      Icon(
                        FontAwesomeIcons.mobile,
                        color: Colors.red,
                        size: 15,
                      ),
                      10.widthBox,
                      Expanded(
                        child: VxBox(child: "Mobile".text.make()).make(),
                      ),
                    ],
                  ).p8(),
                  5.heightBox,
                  Row(
                    children: [
                      VxBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.home,
                              color: Colors.red,
                              size: 15,
                            ),
                            10.widthBox,
                            VxBox(child: "House Number".text.make()).make(),
                          ],
                        ).p8(),
                      ).width(150).make(),
                      VxBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.houseUser,
                              color: Colors.red,
                              size: 15,
                            ),
                            10.widthBox,
                            VxBox(child: "locality".text.make()).make(),
                          ],
                        ).p8(),
                      ).make(),
                    ],
                  ),
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
                      VxBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FontAwesomeIcons.dashcube,
                              color: Colors.red,
                              size: 15,
                            ),
                            10.widthBox,
                            VxBox(child: "zip code".text.make()).make(),
                          ],
                        ).p8(),
                      ).make(),
                    ],
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.mapMarked,
                        color: Colors.red,
                        size: 15,
                      ),
                      10.widthBox,
                      Expanded(
                        child: VxBox(child: "State".text.make()).make(),
                      ),
                    ],
                  ).p8(),
                  VxBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        "Edit".text.red600.semiBold.make().centered().p4(),
                      ],
                    ),
                  )
                      .gray200
                      .height(30)
                      .width(context.percentHeight * 100)
                      .roundedSM
                      .make(),
                ],
              ),
            ).p4(),
          )
        ],
      ),
    );
  }
}
