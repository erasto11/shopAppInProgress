import 'package:flutter/cupertino.dart';
import 'product.dart';
class Products with ChangeNotifier{
  List<Product> _iterms =[
    



  Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2013/07/13/14/08/apparel-162192_960_720.png',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_960_720.jpg',)
   
];
 //bool showOnlyMyFavourity =false;
  List<Product> get iterms{
    // if(showOnlyMyFavourity){
    //   return _iterms.where((element) => element.favourity).toList();
    //  //notifyListeners();
    // }
    // else
    return [..._iterms];
    notifyListeners();

  }
  List<Product>get favourityList{
    return _iterms.where((productid) => productid.favourity).toList();
  }
  Product findById (String id){
  return _iterms.firstWhere((proid) => proid.id==id);
  }
  // void showOnlyFavourity(){
  //   showOnlyMyFavourity = true;
  //   notifyListeners();
  // }
  // void showAll(){
  //   showOnlyMyFavourity=false;
  //   notifyListeners();
  // }


}
