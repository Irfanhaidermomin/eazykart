import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'about.dart';
import 'whoareyou.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/shopping.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: 20,),

                  Row(
                    children: <Widget>[
                      SizedBox(width: 15.0,),
                      Text(
                        'EAZY KART',
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(6, 6),
                                blurRadius: 3.0,
                            )
                          ],
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,

                        ),
                      ),
                      SizedBox(width: 100,),
                      IconButton(
                        color: Colors.blue[900],
                        icon: Icon(Icons.info),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Screen2();
                          },
                          ),
                          );
                        },

                      )
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      Text(
                        'Aapki apni dukaan!',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue[900],
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0,

                    child: Divider(
                      thickness: 1.2,
                      color: Colors.white,
                    ),),

                  SizedBox(width: 20,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                    child: Text(
                        'Connect to your neighbourhood shops and enjoy shopping :)',
                        style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 1.5,

                        )
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    color: Colors.transparent,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Whoareyou();
                        },
                        ),
                        );
                      },

                      child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: ListTile(
                            title: Center(
                              child: Text('TRY NOW',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      );
  }
}


