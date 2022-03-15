import 'package:flutter/material.dart';
import 'package:thirdapp/widget/appDrawer.dart';
import '../provider/oder.dart';
import 'package:provider/provider.dart';
import '../widget/oderDetails.dart';

class OderScreen extends StatelessWidget {
  static const  routeNmae =('/der');
  Widget build(BuildContext context) {
    final ordein = Provider.of<OrderItems>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('payments'),
      ),
      drawer:AppDrawer(),
      body: ListView.builder(
          itemCount: ordein.order.length,
          itemBuilder: (ctx, i) => OderDetails(ordein.order[i])),
    );
  }
}
