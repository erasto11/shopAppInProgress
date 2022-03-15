import 'package:flutter/material.dart';
import '../provider/products_.dart';
import 'package:provider/provider.dart';

class UserProductDetails extends StatelessWidget{
   final String title;
    final String url;
    UserProductDetails( this.title,this.url);
  Widget build(BuildContext context){
   
    // final productDetails = Provider.of<Products>(context);
    return ListTile(
     title: Text(title),
    leading: CircleAvatar(backgroundImage: NetworkImage(url),),
      trailing: Container( 
        width: 100,
   
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.edit,color: Theme.of(context).primaryColor,),
            SizedBox(width: 10,),
            Icon(Icons.delete,color:Theme.of(context).errorColor,)
        
          ],
        ),
      ),
    );
  }
}