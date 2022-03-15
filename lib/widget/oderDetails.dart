import 'package:flutter/material.dart';
import 'package:thirdapp/provider/oder.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OderDetails extends StatefulWidget {
  @override
  final Order orderDetails;
  OderDetails(this.orderDetails);

  @override
  _OderDetailsState createState() => _OderDetailsState();
}

class _OderDetailsState extends State<OderDetails> {
  var _expanded = false;

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.orderDetails.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:m')
                  .format(widget.orderDetails.datetime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
              height:
                  min(widget.orderDetails.cartData.length * 20.0 + 15, 120),
              child: ListView(
                children: widget.orderDetails.cartData
                    .map((prod) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${prod.quatity}x    \$${prod.price}',
                              style:
                                  TextStyle(
                                    fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
