
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'retailerverification.dart';
import 'customerverification.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'rounded_button.dart';

class Whoareyou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

//      appBar: AppBar(),

      body: Container(
           child: SafeArea(
              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.end,
               children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 150, 10, 10),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                          'Who are you?',
                          textStyle: TextStyle(
                              fontSize: 25.0,
                             fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                           )
                       )
                     ],

                     ),
                ),


                 Card(
                     semanticContainer: true,
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     child: Container(
                       decoration: BoxDecoration(
                         image: DecorationImage(
                             image: AssetImage('images/shopping.jpg'),
                             fit: BoxFit.fitWidth
                         ),
                       ),
                       child: TextButton(
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return Customerverification();
                           },
                           ),
                           );
                         },
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 120),
                           child: Text(
                             'I am a Customer',
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 18.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),
                     ),

                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20.0),
                     ),

                     elevation: 10,
                     margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10)
                 ),


                 Card(
                     semanticContainer: true,
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     child: Container(
                       decoration: BoxDecoration(
                         image: DecorationImage(
                             image: AssetImage('images/shopping.jpg'),
                             fit: BoxFit.fitWidth
                         ),
                       ),
                       child: TextButton(
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return Retailerverification();
                           },
                           ),
                           );
                         },
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 125),
                           child: Text(
                             'I am a Retailer',
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 18.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),
                     ),

                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20.0),
                     ),

                     elevation: 10,
                     margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10)
                 ),




        ],
      ),
          ),
      )
    );
  }
}
