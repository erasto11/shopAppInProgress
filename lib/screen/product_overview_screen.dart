import 'package:flutter/material.dart';
import 'package:thirdapp/provider/cart.dart';
import 'package:thirdapp/screen/cartScreen.dart';
import 'package:thirdapp/widget/appDrawer.dart';
import '../provider/product.dart';
import '../widget/productDetails.dart';
import '../widget/productGridFile.dart';
import 'package:provider/provider.dart';
import '../provider/products_.dart';
import '../widget/badge.dart';

enum label {
  All,
  favourity,
}

class ProductOverView extends StatefulWidget {
  @override
  _ProductOverViewState createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  bool showFavourity = false;

  Widget build(BuildContext context) {
    //  final productContaiener = Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (label selected) {
                setState(() {
                  if (selected == label.All) {
                    showFavourity = false;
                  } else {
                    showFavourity = true;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('all '), value: label.All),
                    PopupMenuItem(
                        child: Text('all favourity'), value: label.favourity),
                  ]),
          Consumer<CartItems>(
            builder: (_, dataobject,ch) =>
                Badge(child: ch!, value: dataobject.countItem.toString(), color: Colors.redAccent),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
        title: Text('My shop'),
      ),
      drawer: AppDrawer(),
      body: ProductGrid(showFavourity),
    );
  }
}
