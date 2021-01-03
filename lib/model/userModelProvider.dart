import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyUser extends ChangeNotifier {
  bool isSignedIn = false;
  String _emailAddress, _userDisplayName, _uid;
  List _favProduct = List();

  get email => this._emailAddress;

  get name => this._userDisplayName;

  get uid => this._uid;

  addUser({String emailAddress, String userDisplayName, String uid}) {
    this._emailAddress = emailAddress;
    this._userDisplayName = userDisplayName;
    this._uid = uid;
    this.isSignedIn = true;
    saveUserIdToLocal();
    notifyListeners();
  }

  getUserFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString("userId");
    isSignedIn = userId == null ? false : true;
    notifyListeners();
    print("user is  : $userId");
    return userId;
  }

  saveUserIdToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", this._uid);
    notifyListeners();
  }

  RemoveUserFromLocal() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("userId");
  }

  signOut() {
    this._emailAddress = "null";
    this._uid = null;
    this.isSignedIn = false;
    this._userDisplayName = "null";
    RemoveUserFromLocal();
    notifyListeners();
  }
}
