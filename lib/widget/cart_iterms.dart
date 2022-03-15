import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirdapp/provider/cart.dart';
//import '../provider';

class CartItemsDw extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  CartItemsDw(this.id, this.productId,this.title, this.price, this.quantity);
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(color: Theme.of(context).errorColor,
      child: Icon(Icons.delete,  color:Colors.white,size: 40,),
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
       final remove= Provider.of<CartItems>(context,listen: false);
       remove.removeDirection(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(context: context, builder: (ctx)=>AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to remove the item from the cart ?'),
          actions: [
            FlatButton( child:Text('no'),onPressed: () {
             Navigator.of(ctx).pop(false);
            },),
            FlatButton( child: Text('yes'),onPressed: (){
             Navigator.of(context).pop(true);
            },)
          ] ,
        ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
            ),
            title: Text(title),
            subtitle: Text('total \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
