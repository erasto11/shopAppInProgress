import'package:flutter/material.dart';
import 'package:thirdapp/provider/cart.dart';
import 'package:thirdapp/provider/oder.dart';
import 'package:thirdapp/provider/products_.dart';
import 'package:thirdapp/screen/cartScreen.dart';
import 'package:thirdapp/screen/oderScreen.dart';
import 'package:thirdapp/screen/product_overview_screen.dart';
import '../screen/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../screen/user_product_screen.dart';
import '../screen/editScreen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
    Widget build(BuildContext context){
      return MultiProvider(providers: [
         ChangeNotifierProvider(
        create: (ctx)=>Products(),),
         ChangeNotifierProvider(
           create:(ctx)=>CartItems(),),
         ChangeNotifierProvider(create: (ctx)=>OrderItems())
         
      ],
     
        child: MaterialApp(
          title: 'My shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily:'Lato',
      ),
          home: ProductOverView(),
          routes: {
            ProductDetailScreen.routeName:(context)=>ProductDetailScreen(),
            CartScreen.routeName:(context)=>CartScreen(),
            OderScreen.routeNmae:(context)=>OderScreen(),
            UserProductScreen.routeName:(context)=>UserProductScreen(),
            EditProductScreen.routeName:(context)=>EditProductScreen(),
          }
          ),
          );
      


    
    }
    }
    