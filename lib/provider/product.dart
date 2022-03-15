import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
 final String id;
 final String title;
 final String description;
 final double price;
 final String imageUrl;
 bool favourity=false;
  Product({required this.id,required this.title,required this.description,required this.price,required this.imageUrl, this.favourity=false});

void triggerFav(){
  favourity=!favourity;
  notifyListeners();
}
}