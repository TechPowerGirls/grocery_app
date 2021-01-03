import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:groceryapp/model/product_model.dart';
import 'package:provider/provider.dart';

import 'addressPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ref = Firestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Consumer<Cart>(
              builder: (context, model, child) => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.cartItems.length,
                  itemBuilder: (context, index) {
                    return StreamBuilder(
                        stream: ref
                            .where("prodId",
                                isEqualTo: model.cartItems[index].productId)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            Product productObj = Product.fromJson(
                                snapshot.data.documents[0].data);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        child: Row(
                                          children: <Widget>[
                                            Image.network(
                                                productObj.thumbImage),
                                            Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      productObj.prodName,
                                                    ),
                                                    Text(
                                                      "\$ ${productObj.prodPrice}",
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.remove,
                                                              size: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onPressed: () {
                                                              if (model
                                                                      .cartItems[
                                                                          index]
                                                                      .quantity >
                                                                  1)
                                                                model.decreaseQuantity(
                                                                    model.cartItems[
                                                                        index]);
                                                            },
                                                          ),
                                                          Text(
                                                            model
                                                                .cartItems[
                                                                    index]
                                                                .quantity
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.add,
                                                              size: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onPressed: () {
                                                              if (model
                                                                      .cartItems[
                                                                          index]
                                                                      .quantity <
                                                                  int.parse(
                                                                      productObj
                                                                          .quantityInStock))
                                                                model.increaseQuantity(
                                                                    model.cartItems[
                                                                        index]);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        model.removeCartItem(
                                            model.cartItems[index]);
                                      },
                                      child: Container(
                                        color: Colors.red,
                                        height: 20,
                                        width: 20,
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Text("Loading");
                          }
                        });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Consumer<Cart>(
                  builder: (context, model, child) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: screenWidth,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Price Details",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Cart total"),
                                Text("\$${model.cartTotal}")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Discount"),
                                Text("\$10")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Shipping Cost"),
                                Text("Free")
                              ],
                            ),
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
                                ),
                                Text("\$${model.cartTotal}")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddressPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    height: 45,
                    width: screenWidth,
                    child: Center(
                        child: Text(
                      "Order Now",
                    )),
                  ),
                ) //price details block
              ],
            ),
          )
        ],
      ),
    );
  }
}
