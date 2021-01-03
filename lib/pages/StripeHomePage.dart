//import 'package:eshopping/models/usersProviderModel.dart';
//import 'package:eshopping/pages/AddCreditCard.dart';
//import 'package:eshopping/pages/existingCardPage.dart';

import 'package:flutter/material.dart';
import 'package:groceryapp/model/userModelProvider.dart';
import 'package:groceryapp/services/payment-services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'SelectPayment.dart';
import 'existingCardPage.dart';

class StripeHomePage extends StatefulWidget {
  StripeHomePage({Key key}) : super(key: key);

  @override
  StripeHomePageState createState() => StripeHomePageState();
}

class StripeHomePageState extends State<StripeHomePage> {
  onItemPress(BuildContext context, int index, String uid) async {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddCreditCard()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ExistingCardsPage()));
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: '15000', currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('payments '),
      ),
      body: Consumer<MyUser>(
        builder: (context, model, child) => Container(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, index) {
                Icon icon;
                Text text;

                switch (index) {
                  case 0:
                    icon = Icon(Icons.add_circle, color: Colors.red);
                    text = Text('Pay via new card');
                    break;
                  case 1:
                    icon = Icon(Icons.credit_card, color: Colors.red);
                    text = Text('Pay via existing card');
                    break;
                }

                return InkWell(
                  onTap: () {
                    onItemPress(context, index, model.uid);
                  },
                  child: ListTile(
                    title: text,
                    leading: icon,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: theme.primaryColor,
                  ),
              itemCount: 2),
        ),
      ),
    );
    ;
  }
}
