import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirdapp/provider/cart.dart';
import 'package:thirdapp/widget/cart_iterms.dart';
import '../provider/oder.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartScreen';
  Widget build(BuildContext context) {
    final items = Provider.of<CartItems>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'total',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Chip(
                    label: Text(
                      '\$${items.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title!.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text(
                      'Order Now',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Provider.of<OrderItems>(context, listen: false).addOrder(
                          items.itemsProvide.values.toList(),
                          items.totalAmount);
                          items.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ListView.builder(
              itemCount: items.countItem,
              itemBuilder: (ctx, i) => CartItemsDw(
                  items.itemsProvide.values.toList()[i].id,
                  items.itemsProvide.keys.toList()[i],
                  items.itemsProvide.values.toList()[i].title,
                  items.itemsProvide.values.toList()[i].price,
                  items.itemsProvide.values.toList()[i].quatity),
            ),
          )
        ],
      ),
    );
  }
}
