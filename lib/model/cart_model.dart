import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  List<CartItem> cartItems = [];

  // String _uid;
  int cartTotal = 0;

  /* get uid => this._uid;

  setUid(String uid) {
    this._uid = uid;
    print("User Id Updated");
  }*/

  final ref = Firestore.instance.collection('Cart');

  Map<String, dynamic> _convertCartToMap(CartItem cartItem) {
    Map<String, dynamic> map = {};
    map['quantity'] = cartItem.quantity;
    map['size'] = cartItem.size;
    map['price'] = cartItem.price;
    map['productId'] = cartItem.productId;

    return map;
  }

  addToCart(CartItem cartItem) {
    cartItems.add(cartItem);
    //updateCartTotal();
    //ref.add(cartItem.toJson()).whenComplete(() => print("added to the database"));
    // ref.add(_convertCartToMap(cartItem)).whenComplete(() => print("added to the database"));
    ref.document(cartItem.toString()).setData(toJson());
    notifyListeners();
  }

  removeFromCart(int index) {
    cartItems.removeAt(index);
    updateCartTotal();
    notifyListeners();
    // ref.document(this._uid).setData(toJson());
  }

  removeCartItem(CartItem cartItem) {
    cartItems.remove(cartItem);
    updateCartTotal();
    ref.document(cartItem.toString()).setData(toJson());
    notifyListeners();
  }

  increaseQuantity(CartItem cartItem) {
    cartItem.incrementQuantity();
    updateCartTotal();
    notifyListeners();
    ref.document(cartItem.toString()).setData(toJson());
  }

  decreaseQuantity(CartItem cartItem) {
    cartItem.decrementQuantity();
    updateCartTotal();
    notifyListeners();
    ref.document(cartItem.toString()).setData(toJson());
  }

  updateCartTotal() {
    this.cartTotal = 0;
    cartItems.forEach((cartItem) {
      this.cartTotal = this.cartTotal + (cartItem.price * cartItem.quantity);
    });
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      // "uid": this._uid,
      "cartItems": cartItems.map((cartItem) => cartItem.toJson()).toList(),
      "cartTotal": this.cartTotal
    };
  }

  fromJson(Map data) {
    List cartItemList = data['cartItems']
        .map((cartItem) => cartItemFromJson(cartItem))
        .toList();

    //this._uid = data['uid'];
    this.cartTotal = data['cartTotal'];
    this.cartItems = cartItemList.cast<CartItem>();
    updateCartTotal();
    notifyListeners();
  }

  CartItem cartItemFromJson(Map data) {
    return CartItem(
        quantity: data['quantity'],
        productId: data['productId'],
        //secColor: data['color'],
        size: data['size'],
        price: data['price']);
  }
}

//LOOP THROUGH THE CART ITEM LIST AND CHANGE IT TO JSON\
class CartItem {
  int quantity = 0;
  String size;

  // String secColor;
  String productId;
  int price;

  CartItem({this.quantity, this.size, this.productId, this.price});

  incrementQuantity() {
    this.quantity++;
  }

  decrementQuantity() {
    this.quantity--;
  }

  Map<String, dynamic> toJson() {
    return {
      "quantity": this.quantity,
      "size": this.size,
      //"color": this.secColor,
      "productId": this.productId,
      "price": this.price
    };
  }
}
