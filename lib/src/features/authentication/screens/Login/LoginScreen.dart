import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intelligentproject/src/features/authentication/screens/Description/UserDescription.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Images/best-nature-image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(alignment: Alignment.center,
            child: Container(
              height: 650,
              width: 500,
              margin: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 30),
              padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(
                      new FocusNode()); //on tapping anywhere outside keyboard the keybord goes away
                },
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _welcomeText(),
                      //prints Welcome
                      _latisha_betts(),
                      //prints Latisha Betts
                      _textEmail(),
                      // a text named email is printed
                      _sizeBox(),
                      //size box of 20 height
                      _textFormFieldOfEmail(),
                      // a text Field for Email is produced
                      _textPassword(),

                      // a text named password is printed
                      _textFormFieldOfPassword(),
                      //a text Field for password is produced
                      _sizeBox(),
                      //size box of 20 height


                      _sizeBox(),
                      //size box of 20 height
                      _signInButton(),
                      _sizeBox(),
                      //size box of 20 height
                      _sizeBox(),
                      //size box of 20 height
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _textDontHaveAccount(),
                          _textButtonSignUp(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }

  _welcomeText() {
    return const Text("Welcome",
        style: TextStyle(
            color: Color(0XFF643E95),
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway'
        ));
  }

  _latisha_betts() {
    return const Text(
      "To Our Page",
      style: TextStyle(
          color: Color(0XFF00C088), fontSize: 40, fontWeight: FontWeight.bold,
          fontFamily: 'Raleway'),
    );
  }

  _textEmail() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const Text("Email",
          style: TextStyle(
              color: Colors.black26,
              fontSize: 17,
              fontWeight: FontWeight.w500)),
    );
  }

  _sizeBox() {
    return const SizedBox(
      height: 20,
    );
  }

  _textFormFieldOfEmail() {
    return TextFormField(
      controller: emailController,
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


      decoration: const InputDecoration(
        hintText: "Enter Your email",
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.green,
        // labelText: "Enter your Email",
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF00C088), width: 3),
        ),
      ),
    );
  }

  _textPassword() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      child: const Text("Password",
          style: TextStyle(
              color: Colors.grey, fontSize: 17, fontWeight: FontWeight.w500)),
    );
  }

  _textFormFieldOfPassword() {
    return TextFormField(
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
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        // labelText: "Password",
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF00C088), width: 3),
        ),
      ),
    );
  }


  _signInButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(1000, 60),
          backgroundColor: const Color(0XFF00C088)),
      onPressed: () { signIn(emailController.text, passwordController.text);
        
      },
      child: const Text("Log in"),
    );
  }

  _textDontHaveAccount() {
    return const Text(
      "Don't have account?",
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),
    );
  }

  _textButtonSignUp() {
    return TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 15),
        ),
        onPressed: () {
          Navigator.pushNamed(context,'/second');
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.red,
          ),
        ));
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => UserDEsc())),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}

  


