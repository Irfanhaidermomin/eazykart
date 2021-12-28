import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('About'),
        ),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('images/shopping.jpg'),
    fit: BoxFit.cover,
    )
    ),
    child: SafeArea(
          child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              child: Text(
                'EAZY KART is a simple, easy to use E-Commerce application specifically designed for the local market retailers which falls under the umbrella of Physical-to-online (P2O) commerce. It is a platform where the consumers get a hold on the most nearby shops and get the products as if they were shopping offline. Henceforth, this helps the local businesses to grow and manage their sales comfortably.',
                ),
              ),

          ],
        ),
    ),
        )
    );
  }
}

