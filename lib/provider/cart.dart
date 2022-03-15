import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

//import 'package:provider/provider';
class Cart {
  final String id;
  final String title;
  final int quatity;
  final double price;

  Cart({
    required this.id,
    required this.title,
    required this.quatity,
    required this.price,
  });
}

class CartItems with ChangeNotifier {
  Map<String, Cart> _items = {};
  Map<String, Cart> get itemsProvide {
    return {..._items};
  }

  int get countItem {
    return _items.length;
  }

  double get totalAmount {
    double amount = 0.0;
    _items.forEach((key, value) {
      amount += value.price * value.quatity;
    });
    return amount;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => Cart(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quatity: existingCartItem.quatity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quatity: 1));
    }

    notifyListeners();
  }

  void removeDirection(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void undo(String prodID) {
    if (!_items.containsKey(prodID)) {
      return;
    }
    if (_items[prodID]!.quatity > 1) {
      _items.update(
          prodID,
          (value) => Cart(
              id: value.id,
              title: value.title,
              quatity: value.quatity - 1,
              price: value.price));
    }
    else{
      _items.remove(prodID);
    }
    notifyListeners();
  }
}
