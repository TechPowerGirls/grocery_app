import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/model/userModelProvider.dart';
import 'package:groceryapp/pages/rgisterPage.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

import 'DashBoard.dart';
import 'Home.dart';
import 'HomePge.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password, _userName;
  bool _obscureText = true;
  String displayName = "";
  final TextEditingController _passwordcotroller = new TextEditingController();

  final firebaseAuth = FirebaseAuth.instance;

  //final firebaseUser = null;
  FirebaseUser firebaseUser;

  void initState() {
    super.initState();
  }

  void dispose() {
    if (this.mounted) super.dispose();
    _passwordcotroller.dispose();
  }

  Widget _showUserNameInput() {
    return TextFormField(
      onSaved: (val) => _userName = val,
      validator: (val) => val.length < 6 ? 'User name is too short' : null,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.red,
        ),
        labelText: 'User Email',
        hintText: 'User Email, min length 6 characters',
        focusColor: Color(0xFF0C3853),
      ),
    );
  }

  Widget _showPasswordInput() {
    return TextFormField(
      controller: _passwordcotroller,
      onSaved: (val) => _password = val,
      validator: (val) =>
          val.length < 6 ? 'Password must be of minimum 6 letter' : null,
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            _obscureText = !_obscureText;
          }),
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.red,
        ),
        focusColor: Color(0xFF0C3853),
        labelText: 'Password',
        hintText: 'Enter Password , min. length 6',
      ),
    );
  }

  Widget _showFormActions() {
    return Column(
      children: [
        SizedBox(
          width: 300.0,
          height: 50.0,
          child: Consumer<MyUser>(
            builder: (_, model, child) => RaisedButton(
              onPressed: () {
                _Submit(model); //we are sending model to the submit methode
                // model.addUser(emailAddress: firebaseUser.email,uid: firebaseUser.uid,userDisplayName: displayName);
              },
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 20.0),
              ),
              textColor: Colors.white,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              color: Colors.red,
            ),
          ),
        ),
        FlatButton(
          child: Text("New User? Register"),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RegistrationPage(),
              )),
        ),
      ],
    );
  }

  _signInWithEmailandPassword() async {
    try {
      AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: _userName, password: _password);

      setState(() {
        firebaseUser = authResult.user;
      });
      return authResult.user;
    } catch (e) {
      Fluttertoast.showToast(
          textColor: Colors.white,
          backgroundColor: Colors.black,
          msg: 'user not exist',
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  void _Submit(MyUser user) {
    //here we have created veriable user of type MyUser
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      _signInWithEmailandPassword().whenComplete(() async {
        print(firebaseUser.email);

        final collectionRef = Firestore.instance
            .collection('User')
            .where('userUid', isEqualTo: firebaseUser.uid);
        String displayName = "";
        final documentSnapshot = await collectionRef.getDocuments();

        displayName = documentSnapshot.documents[0].data['userDisplayName'];

        user.addUser(
            emailAddress: firebaseUser.email,
            uid: firebaseUser.uid,
            userDisplayName: displayName);
      });
      final cartRef =
          Firestore.instance.collection("cart").document(firebaseUser.uid);
      cartRef.snapshots().listen((snapshot) {
        Map data = snapshot.data;
      });
      //Provider.of<Cart>(context,listen: false).setUid(firebaseUser.uid);

      print('User name : ${_userName}, Password : ${_password}');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => Home(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      // backgroundColor: Color((0xFF0C3853)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showUserNameInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showPasswordInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showFormActions(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
