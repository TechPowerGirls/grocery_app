import 'dart:html';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentProvider with ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  PaymentMethod _paymentMethod = PaymentMethod();

  PaymentProvider.initialize() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51H7iyiIceXccGMrkbTptITrm6iU07dW83QJLPMaTakelEQGAHlKKWNqoRLK7R1AZxudNFi4Z20DKheX2EDvcDzRh008uIkuWJC"));
  }

  void addCard() {
    StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
        .then((paymentMethod) {
      _paymentMethod = paymentMethod;
    }).catchError((err) {
      print("There was an error: ${err.toString()}");
    });
  }
}
