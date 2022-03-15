import 'package:flutter/material.dart';
import 'package:thirdapp/screen/oderScreen.dart';
import 'package:thirdapp/screen/user_product_screen.dart';
class AppDrawer extends StatelessWidget{
  Widget build(BuildContext context){
  return Drawer(
    child: Column(children: [
      AppBar(title: Text('Shop menu'),automaticallyImplyLeading: false,),
      Divider(),
      ListTile(
        leading: Icon(Icons.shop,),title:Text('shop'),
        onTap: () => {
          Navigator.of(context).pushReplacementNamed('/'),
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.payment),title:Text('payment'),
        onTap: () => {
          Navigator.of(context).pushReplacementNamed(OderScreen.routeNmae),
        },
      ),
       Divider(),
      ListTile(
        leading: Icon(Icons.edit),title:Text('Manage Products'),
        onTap: () => {
          Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName),
        }, 
      )
    ],),

  );
  }
}