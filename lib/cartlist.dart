import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shoppingcart.dart';
import 'item.dart';

class Cartlist extends StatefulWidget {
  final ShoppingCart cart;

  Cartlist({required this.cart});

  @override
  State<StatefulWidget> createState() {
    return _CartListWidgetState();
  }
}

class _CartListWidgetState extends State<Cartlist> {
//  static const platform = const MethodChannel('camellabs.com/payment');
//
//  Future<void> _checkout() async {
//    await platform.invokeMethod('charge', widget.cart.toMap);
//  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    widget.cart.items.forEach((c) {
      items.add(_CartListItemWidget(
        item: c,
      ));
      items.add(Padding(
        padding: EdgeInsets.only(top: 8.0),
      ));
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
//                this._checkout()
              },
              child: Text("Checkout"),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(color: Color(0xfff0eff4)),
            child: Stack(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.only(bottom: 64),
                  children: items,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 64,
                  child: _CartListSummaryFooterWidget(
                    totalPrice: widget.cart.formattedTotalPrice,
                  ),
                )
              ],
            )));
  }
}

class _CartListSummaryFooterWidget extends StatelessWidget {
  final String totalPrice;

  _CartListSummaryFooterWidget({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0XFFF4F4F4),
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    'Total',
                    textAlign: TextAlign.left,
                    //style: Theme.of(context).textTheme.title,
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black // Colors.grey[300],
                    ),
                  ),
                  Expanded(
                      child: Text(
                        this.totalPrice,
                        textAlign: TextAlign.right,
                        //style: Theme.of(context).textTheme.subhead,
                        style: TextStyle(
                          color: Colors.black,
                          decorationStyle: TextDecorationStyle.wavy,
                        ),
                      ))
                ],
              )),
        ));
  }
}

class _CartListItemWidget extends StatelessWidget {
  final Item item;

  _CartListItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
              bottom: BorderSide(color: Colors.grey, width: 0.5))),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 64,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(item.imageUrl),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          Expanded(
              child: Text(
                item.name,
                //style:
                //Theme.of(context).textTheme.title.apply(fontSizeFactor: 0.75),
                style: TextStyle(
                  color: Colors.black,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          Text(
            item.formattedPrice,
            textAlign: TextAlign.right,
            //style: Theme.of(context).textTheme.subhead,
            style: TextStyle(
              color: Colors.black,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          )
        ],
      ),
    );
  }
}