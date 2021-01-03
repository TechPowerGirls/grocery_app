import 'package:flutter/material.dart';
import 'package:groceryapp/pages/HomePge.dart';
import 'package:groceryapp/pages/loginPage.dart';
import 'package:provider/provider.dart';

import 'model/cart_model.dart';
import 'model/selectedSizeSpecification.dart';
import 'model/userModelProvider.dart';
import 'pages/DashBoard.dart';
import 'pages/Home.dart';
import 'package:awesome_card/awesome_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyUser>(create: (_) => MyUser(),),
        ChangeNotifierProvider<Cart>(create: (_) => Cart(),),
        ChangeNotifierProvider<SelectedSizeSpecifications>(
          create: (_) => SelectedSizeSpecifications(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}

