import 'package:flutter/material.dart';
import 'cart.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> cartData;
  final DateTime datetime;

  Order(
      {required this.id,
      required this.amount,
      required this.cartData,
      required this.datetime});
}

class OrderItems with ChangeNotifier {
  List<Order> _order = [];
  List<Order> get order {
    return [..._order];
  }

  void addOrder(List<Cart> listOfOrder, double total) {
    _order.insert(
      0,
      Order(
          id: DateTime.now().toString(),
          amount: total,
          datetime: DateTime.now(),
          cartData: listOfOrder),
    );
    notifyListeners();
  }
}
