import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'succesfulregister.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
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
          firstNameEditingController.text = value!;
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
        controller: passwordEditingController,
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
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
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
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Success()),
            (route) => true);
  }
}


//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'shoplist.dart';
//
//class Customerregister extends StatefulWidget {
//  @override
//  _CustomerregisterState createState() => _CustomerregisterState();
//}
//
//class _CustomerregisterState extends State<Customerregister> {
//
//  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//
//
//  final _auth = FirebaseAuth.instance;
//  late String email;
//  late String password;
//  late String name;
//
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//        future: _initialization,
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.done) {
//            return Scaffold(
//
//              appBar: PreferredSize(
//                preferredSize: Size.fromHeight(200),
//                child: AppBar(
//                  centerTitle: true,
//                  elevation: 0,
//                  title: Text('REGISTER',
//                    style: TextStyle(
//                      shadows: <Shadow>[
//                        Shadow(
//                          offset: Offset(4, 4),
//                          blurRadius: 3.0,
//                          color: Colors.grey,
//                        )
//                      ],
//                      fontSize: 25.0,
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      letterSpacing: 3,
//
//
//                    ),
//                  ),
//                  flexibleSpace: Image(
//                    image: AssetImage('images/shopping.jpg'),
//                    fit: BoxFit.cover,
//                  ),
//
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.vertical(
//                        bottom: Radius.circular(10),
//                      )
//                  ),
//                ),
//              ),
//
//
//              body: Padding(
//                padding: const EdgeInsets.all(50.0),
//                child: Column(
//                  children: <Widget>[
//
//                    TextField(
//                      textAlign: TextAlign.center,
//                      onChanged: (value) {
////Do something with the user input.
//                        name = value;
//                      },
//                      decoration: InputDecoration(
//                        hintText: 'Enter your name',
//                        contentPadding:
//                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.blueAccent,
//                              width: 1.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.blueAccent,
//                              width: 2.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 10),
//                    TextField(
//                      textAlign: TextAlign.center,
//                      onChanged: (value) {
////Do something with the user input.
//                        email = value;
//                      },
//                      decoration: InputDecoration(
//                        hintText: 'Enter your email',
//                        contentPadding:
//                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.blueAccent,
//                              width: 1.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.blueAccent,
//                              width: 2.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 10),
//                    TextField(
//                      obscureText: true,
//                      textAlign: TextAlign.center,
//                      onChanged: (value) {
////Do something with the user input.
//                        password = value;
//                      },
//                      decoration: InputDecoration(
//                        hintText: 'Generate a new password',
//                        contentPadding:
//                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.blueAccent,
//                              width: 1.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.blueAccent,
//                              width: 2.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                      ),
//                    ),
//
//                    Padding(
//                      padding: EdgeInsets.symmetric(vertical: 16.0),
//                      child: Material(
//                        color: Colors.blueAccent,
//                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                        elevation: 5.0,
//                        child: MaterialButton(
//                          onPressed: () async {
////Implement registration functionality.
//                            final newuser = await _auth
//                                .createUserWithEmailAndPassword(
//                                email: email, password: password);
//                            if (newuser != null) {
//                              Navigator.push(
//                                context, MaterialPageRoute(builder: (context) {
//                                return Shoplist();
//                              },
//                              ),
//                              );
//                            }
//                          },
//                          minWidth: 200.0,
//                          height: 42.0,
//                          child: Text(
//                            'Register',
//                            style: TextStyle(color: Colors.white),
//                          ),
//
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            );
//          }
//         return Text('loading');
//        }
//    );
//  }
//}
//
