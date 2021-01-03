import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/model/userModelProvider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'loginPage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  var _countryMap = ['India', 'United Kingdom', 'New Zealand'];
  String _userName, _password, _email, _confirmPassword;
  bool _obscureText = true;
  final TextEditingController _passwordcotroller = new TextEditingController();
  final TextEditingController _ConfirmPasswordCotroller =
      new TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  String _country, _mobileno;
  FocusNode _focusNode = new FocusNode();

  @override
  Widget _showUserNameInput() {
    return TextFormField(
      onSaved: (val) => _userName = val,
      validator: (val) => val.length < 6 ? 'User name is too short' : null,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          Icons.face,
          color: Colors.red,
        ),
        labelText: 'User Name',
        hintText: 'User Name, min length 6 characters',
        focusColor: Color(0xFF0C3853),
      ),
    );
  }

  Widget _showUserEmailInput() {
    return TextFormField(
      onSaved: (val) => _email = val,
      validator: (val) => val.length < 6 ? 'Email  is too short' : null,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.red,
        ),
        labelText: 'Email',
        hintText: 'Email, min length 6 characters',
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

  Widget _showConfirmPasswordInput() {
    return TextFormField(
      controller: _ConfirmPasswordCotroller,
      onSaved: (val) => _confirmPassword = val,
      validator: (val) {
        if (val != _passwordcotroller.text) {
          return "Passwords do not match";
        } else {
          return null;
        }
      },
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
        labelText: 'Confirm Password',
        hintText: 'Enter Confirm Password , min. length 6',
      ),
    );
  }

  Widget _showFormActions() {
    return Column(
      children: [
        Consumer<MyUser>(
          builder: (_, model, child) => RaisedButton(
            onPressed: () {
              _submit();
              model.addUser(
                  emailAddress: _email,
                  uid: firebaseUser.uid,
                  userDisplayName: _userName);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LoginPage(),
              ));
            },
            // onPressed: () => _submit(),
            child: Text('Register'),
            textColor: Colors.white,
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            color: Colors.red,
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      _signUpWithEmailandPassword();
    } else
      print('Invalid form');
  }

  _signUpWithEmailandPassword() async {
    try {
      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      setState(() {
        firebaseUser = authResult.user;
      });
      adduserDetailsToDatabase();
    } catch (e) {
      Fluttertoast.showToast(
          textColor: Colors.white,
          backgroundColor: Colors.black,
          msg: 'user is already exist',
          toastLength: Toast.LENGTH_SHORT);
      //print("user is already exist");
    }
  }

  adduserDetailsToDatabase() {
    final CollectionReference userReference =
        Firestore.instance.collection('User');
    final userToAdd = {
      "userDisplayName": _userName,
      "userPassword": _password,
      "userUid": firebaseUser.uid,
      "userEmail": _email,
    };
    // Provider.of<Cart>(context, listen: false).setUid(firebaseUser.uid);
    userReference.add(userToAdd).whenComplete(() =>
        Provider.of<MyUser>(context, listen: false).addUser(
            emailAddress: _email,
            uid: firebaseUser.uid,
            userDisplayName: _userName));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => LoginPage(),
    ));
    print("navigate to new page");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
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
                  child: _showUserEmailInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showPasswordInput(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _showConfirmPasswordInput(),
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
