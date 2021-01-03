import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:groceryapp/model/product_model.dart';
import 'package:groceryapp/model/selectedSizeSpecification.dart';
import 'package:groceryapp/pages/StripeHomePage.dart';
import 'package:groceryapp/widgets/detailpage/Sizewidget.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'cartPage.dart';

class ProductDetailPage extends StatefulWidget {
  final Product productDetail;

  ProductDetailPage(this.productDetail);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quqntityNumber = 0;
  final CartRef = Firestore.instance.collection("Cart");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail Page"),
        backgroundColor: Colors.red,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartPage()));
            },
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 3,
                  left: 3,
                  child: Consumer<Cart>(
                    builder: (_, model, child) => CircleAvatar(
                      child: Text(model.cartItems.length.toString()),
                      radius: 10,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: StreamBuilder(
          stream: CartRef.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final p = snapshot.data.documents;
              List productSize = [];

              List<Product> listOfProducts = [];
              p.forEach((element) {
                listOfProducts.add(Product.fromJson(element.data));
              });
              for (int i = 0; i < listOfProducts.length; i++) {
                productSize.add(listOfProducts[i].prodSize);
              }

              print(productSize.toString());

              return Container(
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StripeHomePage()));
                      },
                      child: VxBox(
                              child: "Buy Now"
                                  .text
                                  .bold
                                  .xl
                                  .white
                                  .make()
                                  .centered())
                          .red600
                          .height(context.isLandscape
                              ? context.percentHeight * 15
                              : context.percentHeight * 8)
                          .make(),
                    )),
                    Expanded(
                        child: Consumer<Cart>(
                      builder: (_, cartModel, child) =>
                          Consumer<SelectedSizeSpecifications>(
                        builder: (_, SpecSizeModel, child) => VxBox(
                                child: InkWell(
                          onTap: () {
                            CartItem cartItem = CartItem(
                                productId: widget.productDetail.prodId,
                                price:
                                    int.parse(widget.productDetail.prodPrice),
                                size: SpecSizeModel.selectedSize,
                                quantity: quqntityNumber
                                //int.parse(widget.productDetail.quantityInStock),
                                );

                            cartModel.addToCart(cartItem);

                            print("Added to the cart");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              "Add to Cart"
                                  .text
                                  .bold
                                  .xl
                                  .red600
                                  .make()
                                  .centered(),
                              Icon(
                                Icons.shopping_basket,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ))
                            .height(context.isLandscape
                                ? context.percentHeight * 5
                                : context.percentHeight * 8)
                            .make(),
                      ),
                    ))
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          }),
      body: Column(
        children: [
          Expanded(
            child: VxResponsive(
              small:
                  Content(widget.productDetail).h(context.percentHeight * 60),
              fallback: Content(widget.productDetail),
            ),
          ),
        ],
      ),
    );
  }
}

class CartAddButton extends StatefulWidget {
  final Product productDetail;

  CartAddButton(this.productDetail);

  @override
  _CartAddButtonState createState() => _CartAddButtonState();
}

class _CartAddButtonState extends State<CartAddButton> {
  int quqntityNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<Cart>(
        builder: (_, model, child) => Container(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  /*  if(quqntityNumber<int.parse(widget.productDetail.quantityInStock))
                  {//quqntityNumber=quqntityNumber++;
                    setState(() {

                      quqntityNumber++;
                    });

                  }

                  else{
                    print("out of stock");
                  }
*/

                  print(quqntityNumber);
                },
                child: VxBox(
                        child: Icon(
                  Icons.add,
                  color: Colors.white,
                ).p12())
                    .red600
                    .roundedSM
                    .make(),
              ),
              Container(
                  child: Text("$quqntityNumber").text.xl2.bold.make().p4()),
              //$quqntityNumber.text.xl2.bold.make().p12()).roundedSM.make(),
              VxBox(
                  child: InkWell(
                onTap: () {
                  if (quqntityNumber > 0) {
                    //quqntityNumber=quqntityNumber++;
                    setState(() {
                      quqntityNumber--;
                    });
                  } else {
                    print("allready delet all items");
                  }

                  print(quqntityNumber);
                },
                child: Center(
                  child: Icon(
                    Icons.minimize,
                    color: Colors.white,
                  ).p12(),
                ),
              )).red600.roundedSM.make(),
            ],
          ).pOnly(left: context.isLandscape ? 140 : 130),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final Product productDetail;

  Content(this.productDetail);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            VxBox()
                .red600
                .height(context.isLandscape
                    ? context.percentHeight * 20
                    : context.percentHeight * 10)
                .make(),
            VxBox(
              child: Card(
                  child: Stack(
                children: <Widget>[
                  Image.network(
                    productDetail.images[0],
                    height: context.isMobile
                        ? context.screenHeight * 0.2
                        : context.screenHeight * 0.4,
                  ).centered(),
                  productDetail.prodPrice.text.xl2.make().centered().pOnly(
                        top: 140,
                      ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(productDetail.prodSize[0])
                              .text
                              .make()
                              .p12()
                              .box
                              .gray300
                              .make(),
                          // productDetail.prodSize[0].text.make().p12().box.gray300.make(),
                          VxRating(
                            onRatingUpdate: (value) {},
                            count: int.parse(productDetail.prodRating),
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
                        ? context.percentHeight * 50
                        : context.percentHeight * 30)
                .roundedSM
                .make(),
          ],
        ),
        20.heightBox,
        productDetail.prodName.text.xl2.bold.make(),
        productDetail.prodDescription.text.gray600.make().p16(),
        20.heightBox,
        ProductSize(productDetail.prodSize),
      ],
    );
  }
}
