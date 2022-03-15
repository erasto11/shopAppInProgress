import 'package:flutter/material.dart';
import 'package:thirdapp/provider/product.dart';
import '/widget/productDetails.dart';
import '../screen/product_details_screen.dart';
import '../provider/products_.dart';
import 'package:provider/provider.dart';
class ProductGrid extends StatelessWidget {
  bool showfav;
  ProductGrid(this.showfav);
 

  @override
  Widget build(BuildContext context) {
    final productsData =Provider.of<Products>(context);
    final product = showfav? productsData.favourityList:productsData.iterms;
    return GridView.builder(
      padding: EdgeInsets.all(10),
       itemCount:product.length ,
       itemBuilder:(ctx, i)=>ChangeNotifierProvider.value(
         value:product[i],
         child:ProductDetails()), 
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2,crossAxisSpacing: 10,mainAxisSpacing: 10)
       );
  }
}