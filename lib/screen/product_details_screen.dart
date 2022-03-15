import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirdapp/provider/products_.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-deatail';

  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context)!.settings.arguments as String;
    final loaded =
        Provider.of<Products>(context, listen: false).findById(itemId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loaded.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loaded.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(loaded.title),
          SizedBox(height: 10),
          Text(
            '\$${loaded.price}',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              loaded.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ],
      )),
    );
  }
}
