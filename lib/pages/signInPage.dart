import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        body: SingleChildScrollView(
          child: Container(
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              //border: Border.all(width: 8,color: Colors.red,style: BorderStyle.solid)
            ),
            child: Column(
              children: <Widget>[
                // VxRating(),
                Row(
                  children: <Widget>[
                    Expanded(child: "Sign In".text.size(20).black.bold.make()),
                    "Sign Up".text.size(20).green500.bold.make(),
                  ],
                ).pOnly(top: 20, left: 15, right: 15),
                HeightBox(15),

                "Welcome to Grocery Shop".text.size(22).blue700.bold.make(),
                HeightBox(10),
                "Let's get started".text.size(16).gray900.make(),
                HeightBox(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // CommonLogo(),
                    //HeightBox(10),

                    TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          //filled: true,
                          fillColor: Colors.white,
                          labelText: "Username",
                        )).p4().px24(),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        //      filled: true,
                        fillColor: Colors.white,
                        labelText: "Email",
                      ),
                    ).p4().px24(),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        //      filled: true,
                        fillColor: Colors.white,
                        labelText: "Password",
                      ),
                    ).p4().px24(),
                    HeightBox(20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.lightGreen,
                      ),
                      child: FlatButton(
                          child: "Sign In".text.size(20).bold.make()),
                    ).pOnly(left: 250),
                    HeightBox(10),
                    /*HStack([
                      Checkbox(
                        value: checked, onChanged: (bool value) { checked=value ;},
                      ),
                      "Remember Me".text.make().py16()
                    ]),
                    HStack([
                      VxBox(child: "Get Started".text.white.makeCentered().p16()).green600.roundedLg.make(),
                    ]),
                    GestureDetector(
                      onTap: (){
                        print("Sign In");
                      },
                      child: HStack([
                        "Forgot Password?".text.white.makeCentered(),
                      ]).centered().p4(),
                    ),*/
                    /* HeightBox(40),
                    Center(
                      child: Row(
                        children: <Widget>[


                          "Or".text.make(),
                          WidthBox(5),
                          Divider(thickness: 1,
                            color: Colors.black,),

                        ],
                      ),
                    ),
                    HStack([
                      VxBox(child:  FaIcon(FontAwesomeIcons.facebookF,color: Colors.white,size: 30,).p20()).blue700.roundedFull.make(),
                      VxBox(child:  FaIcon(FontAwesomeIcons.google,color: Colors.white,size: 25,).p20()).red700.roundedFull.make().p4(),
                    ])*/
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
          },
          child: Container(
              height: 25,
              color: Colors.lightBlue,
              child: Center(
                  child: "Create a new Account..! Sign Up"
                      .text
                      .white
                      .makeCentered())),
        ),
      ),
    );
  }
}
