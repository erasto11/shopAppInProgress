import 'package:flutter/material.dart';
import '../provider/products_.dart';
import 'package:provider/provider.dart';
import '../widget/user_product_details.dart';
import '../widget/appDrawer.dart';
import '/screen/editScreen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/userP';
  @override
  Widget build(BuildContext context) {
    final userProduct = Provider.of<Products>(context);
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Manage your product'),
        actions: [IconButton( icon: Icon(Icons.add), onPressed: (){
         Navigator.of(context).pushNamed(EditProductScreen.routeName);
        },)],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: userProduct.iterms.length,
            itemBuilder: (_, i) => Column(children:[UserProductDetails(
                userProduct.iterms[i].title,
                 userProduct.iterms[i].imageUrl),
                 Divider(),
                 ]),
                 
        )));
    
  }
}
