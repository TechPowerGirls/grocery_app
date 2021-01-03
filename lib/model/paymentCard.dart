import 'package:flutter/cupertino.dart';

class PaymentCard extends ChangeNotifier {
  //String _username;
  String _cardNumber;
  String _cardholderName;
  String _cardType;
  String _cvcCode;
  String _expiryDate;
  bool _showBack;
  String _uid;

  get cardNumber => this._cardNumber;

  get cardholderName => this._cardholderName;

  get cardType => this._cardType;

  get cvcCode => this._cvcCode;

  get expiryDate => this._expiryDate;

  get showBack => this._showBack;

  get uid => this._uid;

  PaymentCard.fromJson(Map data) {
    this._cardholderName = data['cardholderName'];

    this._cardNumber = data['cardNumber'];
    this._cardType = data['cardType'];
    this._cvcCode = data['cvcCode'];
    this._expiryDate = data['expiryDate'];
    this._uid = data['uid'];
    this._showBack = data['showBack'];

    //this._username=data['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardholderName'] = this._cardholderName;
    data['cardNumber'] = this._cardNumber;
    data['cardType'] = this._cardType;
    data['showBack'] = this._showBack;
    data['expiryDate'] = this._expiryDate;
    data['uid'] = this._uid;
    return data;
  }
}
