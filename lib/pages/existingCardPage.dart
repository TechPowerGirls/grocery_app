import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:eshopping/models/paymentCard.dart';
//import 'package:eshopping/service/payment-services.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/model/paymentCard.dart';
import 'package:groceryapp/pages/HomePge.dart';
import 'package:groceryapp/services/payment-services.dart';
//import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:stripe_payment/stripe_payment.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'OrderPlacedSuccessful.dart';

//import 'Thankyou.dart';

class ExistingCardsPage extends StatefulWidget {
  ExistingCardsPage({Key key}) : super(key: key);

  @override
  ExistingCardsPageState createState() => ExistingCardsPageState();
}

class ExistingCardsPageState extends State<ExistingCardsPage> {
  final CollectionReference ref = Firestore.instance.collection("paymentCard");

  payViaExistingCard(BuildContext context, PaymentCard card) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var expiryArr = card.expiryDate.split('/');
    CreditCard stripeCard = CreditCard(
      number: card.cardNumber,
      expMonth: int.parse(expiryArr[0]),
      expYear: int.parse(expiryArr[1]),
    );
    var response = await StripeService.payViaExistingCard(
        amount: '2500', currency: 'USD', card: stripeCard);
    await dialog.hide();
    Scaffold.of(context)
        .showSnackBar(SnackBar(
          content: Text(response.message),
          duration: new Duration(milliseconds: 1200),
        ))
        .closed
        .then((_) {
      //Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderSuccesful(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Choose existing card'),
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              List<PaymentCard> cards = [];
              snapshot.data.documents.forEach((document) {
                cards.add(PaymentCard.fromJson(document.data));
                print(cards);
              });

              return Container(
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    var card = cards[index];

                    return InkWell(
                      onTap: () {
                        payViaExistingCard(context, card);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                          height: 180,
                          width: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 40,
                                      width: 50,
                                    ),
                                    Text(
                                      "CARD",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  card.cardNumber,
                                  style: TextStyle(
                                    letterSpacing: 4.0,
                                    fontSize: 24,
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                /*Text(card.cvcCode,style: TextStyle(
                           fontSize: 30,
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                         ),),*/
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      card.cardholderName.toUpperCase(),
                                      style: TextStyle(
                                        letterSpacing: 2.0,
                                        fontSize: 25,
                                        color: Colors.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      card.expiryDate.toString().substring(2),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Text("Loading");
            }
          }),
    );
  }
}
