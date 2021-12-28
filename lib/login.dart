import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'shoplist.dart';
import 'customerregister.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        ),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                               return RegistrationScreen();
                               },
                             ),
                           );
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Shoplist())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'shoplist.dart';
//
//class Login extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(200),
//        child: AppBar(
//          centerTitle: true,
//          elevation: 0,
//          title: Text('Log In',
//            style: TextStyle(
//              shadows: <Shadow>[
//                Shadow(
//                  offset: Offset(4, 4),
//                  blurRadius: 3.0,
//                  color: Colors.grey,
//                )
//              ],
//              fontSize: 25.0,
//              color: Colors.white,
//              fontWeight: FontWeight.bold,
//              letterSpacing: 3,
//
//
//            ),
//          ),
//          flexibleSpace: Image(
//            image: AssetImage('images/shopping.jpg'),
//            fit: BoxFit.cover,
//          ),
//
//          shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.vertical(
//                bottom: Radius.circular(10),
//              )
//          ),
//        ),
//      ),
//
//
//      body: Padding(
//        padding: const EdgeInsets.all(50.0),
//        child: Column(
//          children: <Widget>[
//
//            TextField(
//              textAlign: TextAlign.center,
//              onChanged: (value) {
//                //Do something with the user input.
//              },
//              decoration: InputDecoration(
//                hintText: 'Enter your email',
//                contentPadding:
//                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                enabledBorder: OutlineInputBorder(
//                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                focusedBorder: OutlineInputBorder(
//                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//              ),
//            ),
//            SizedBox(height: 10),
//            TextField(
//              obscureText: true,
//              textAlign: TextAlign.center,
//              onChanged: (value) {
//                //Do something with the user input.
//              },
//              decoration: InputDecoration(
//                hintText: 'Enter your password',
//                contentPadding:
//                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                enabledBorder: OutlineInputBorder(
//                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                focusedBorder: OutlineInputBorder(
//                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//              ),
//            ),
//
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 16.0),
//              child: Material(
//                color: Colors.blueAccent,
//                borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                elevation: 5.0,
//                child: MaterialButton(
//                  onPressed: () {
//                    //Implement registration functionality.
//                    Navigator.push(context, MaterialPageRoute(builder: (context){
//                      return Shoplist();
//                    },
//                    ),
//                    );
//
//                  },
//                  minWidth: 200.0,
//                  height: 42.0,
//                  child: Text(
//                    'Login',
//                    style: TextStyle(color: Colors.white),
//                  ),
//
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
