import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cartlist.dart';
import 'shoppingcart.dart';
import 'item.dart';

class Shoplist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoplistState();
  }
}

class _ShoplistState extends State<Shoplist> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if(user!=null){
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }


  ShoppingCart cart = ShoppingCart();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Item> items = Item.dummyItems;

  @override
  Widget build(BuildContext context) {
    final columnCount =
    MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4;

    final width = MediaQuery.of(context).size.width / columnCount;
    const height = 400;

    List<Widget> items = [];
    for (var x = 0; x < this.items.length; x++) {
      bool isSideLine;
      if (columnCount == 2) {
        isSideLine = x % 2 == 0;
      } else {
        isSideLine = x % 4 != 3;
      }
      final item = this.items[x];

      items.add(_ShopListItem(
        item: item,
        isInCart: cart.isExists(item),
        isSideLine: isSideLine,
         onTap: (item) {
//           _scaffoldKey.currentState.hideCurrentSnackBar();
//
//           if (cart.isExists(item)) {
//             cart.remove(item);
//             _scaffoldKey.currentState.showSnackBar(SnackBar(
//               content: Text('Item is removed from cart!'),
//             ));
//           } else if (item.inStock) {
//             cart.add(item);
//             _scaffoldKey.currentState.showSnackBar(SnackBar(
//               content: Text('Item is added to cart!'),
//             ));
//           } else {
//             _scaffoldKey.currentState.showSnackBar(SnackBar(
//               content: Text('Item is out of stock!'),
//             ));
//           }
//           this.setState(() {});
         },
      ));
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("The Hill Shop"),
        ),
        body: GridView.count(
          childAspectRatio: width / height,
          scrollDirection: Axis.vertical,
          crossAxisCount: columnCount,
          children: items,
        ),
             floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Cartlist(cart: ShoppingCart());
                      },
                      ),
                      );
                    },
               child: Text('Go To Cart'),
               backgroundColor: Colors.blue,
            ));
  }
}

class _ShopListItem extends StatelessWidget {
  final Item item;
  final bool isInCart;
  final bool isSideLine;
  dynamic onTap;

  _ShopListItem({required this.item,required this.isInCart, required this.isSideLine, this.onTap});

  @override
  Widget build(BuildContext context) {
    Border border;
    if (isSideLine) {
      border = Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
          right: BorderSide(color: Colors.grey, width: 0.5));
    } else {
      border = Border(bottom: BorderSide(color: Colors.grey, width: 0.5));
    }

    return InkWell(
        onTap: () => this.onTap(item),
        child: Container(
            decoration: BoxDecoration(border: border),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Container(
                  child: AspectRatio(
                    aspectRatio: 1,
//                    child: Image.network('https://www.google.com/imgres?imgurl=https%3A%2F%2F5.imimg.com%2Fdata5%2FSELLER%2FDefault%2F2021%2F3%2FDV%2FXG%2FEL%2F5187258%2Folive-oil-500x500.jpg&imgrefurl=https%3A%2F%2Fwww.indiamart.com%2Fproddetail%2Folive-oil-23277523491.html&tbnid=1RSoJUd62gPhSM&vet=12ahUKEwiCutfXlsz0AhUyoekKHZxzABUQMygFegUIARDZAQ..i&docid=7uR_MGWVuIxNzM&w=500&h=500&itg=1&q=olive%20oil&ved=2ahUKEwiCutfXlsz0AhUyoekKHZxzABUQMygFegUIARDZAQ'),
                    child: Image.network(item.imageUrl),
                  ),
                  height: 250,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Text(item.name,
                    textAlign: TextAlign.center,
                    // style: Theme.of(context)
                    //     .textTheme
                    //     .title
                    //     .apply(fontSizeFactor: 0.8)),
                    style: TextStyle(
                      color: Colors.black,
                      decorationStyle: TextDecorationStyle.wavy,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Text(item.formattedPrice,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      decorationStyle: TextDecorationStyle.wavy,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Text(this.isInCart ? "In Cart" : item.formattedAvailability,
                    textAlign: TextAlign.center,
                    // style: Theme.of(context).textTheme.caption.apply(
                    //     fontSizeFactor: 0.8,
                    style: TextStyle(
                      //color: Colors.black,
                        decorationStyle: TextDecorationStyle.wavy,
                        color:
                        isInCart ? Colors.blue : item.availabilityColor)),

              ],
            )));
  }
}