import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool? check1 = true, signUP = false, signUp1 = false;
  final _formKey = GlobalKey<FormState>();
  RegExp pass_valid = RegExp(r"((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)){10,}");
  RegExp pass_valid_email = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateEmail(String pass) {
    String _email = pass.trim();
    if (pass_valid_email.hasMatch(_email)) {
      return true;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
              padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              child: GestureDetector(
                onTap: (){
                  FocusScope.of(context).requestFocus(new FocusNode());//on tapping anywhere outside keyboard the keybord goes away
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

                      Row(
                        children: [
                          _checkBox(),
                          //check box with Remember me is created
                          Container(
                              margin: const EdgeInsets.only(left: 10, right: 30),
                              padding: const EdgeInsets.only(
                                right: 25,
                              ),
                              child: const Text(
                                "Remember Me",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              )),
                          SizedBox(width: 80,),
                          _textButtonForgetPassword(),
                          // Forget me text button is created
                        ],
                      ),
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
              color: Colors.black26, fontSize: 17, fontWeight: FontWeight.w500)),
    );
  }

  _sizeBox() {
    return const SizedBox(
      height: 20,
    );
  }

  _textFormFieldOfEmail() {
    return TextFormField(
      validator: (value1) {
        if (value1!.isEmpty) {
          return "please enter email";
        } else {
          bool result1 = validateEmail(value1);
          if (result1) {
            signUp1 = true;
          } else {
            return "Write Email in abc@xyz.com form";
          }
        }
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
      validator: (value) {
        if (value!.isEmpty) {
          return "plese enter a password";
        } else {
          bool result = validatePassword(value);
          if (result) {
            signUP = true;
          } else {
            return "Password should contain Capital, small letter & \nNumber & Special character with atleast 10";
          }
        }
      },
      obscureText: true,
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

  _checkBox() {
    // return Expanded(
    //   child: CheckboxListTile(
    //       contentPadding: EdgeInsets.zero,
    //
    //     //checkbox positioned at left
    //
    //     value: check1,
    //     activeColor: const Color(0XFF00C088),
    //     checkColor: Colors.white,
    //
    //
    //     controlAffinity: ListTileControlAffinity.leading,
    //     onChanged: (bool? value) {
    //       setState(() {
    //         check1 = value;
    //       });
    //     },
    //     title: const Text("Remember Me",
    //
    //         style: TextStyle(
    //             color: Colors.grey,
    //             fontSize: 15,
    //             fontWeight: FontWeight.w500)),
    //   ),
    // );
    return SizedBox(
      height: 20.0,
      width: 20.0,
      child: Checkbox(
        //only check box
          value: check1,
          activeColor: const Color(0XFF00C088), //unchecked
          onChanged: (bool? value) {
            //value returned when checkbox is clicked
            setState(() {
              check1 = value;
            });
          }),
    );
  }


  _textButtonForgetPassword() {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(left: 20),
          textStyle: const TextStyle(fontSize: 15),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/forgotpassword');
        },
        child: const Text(
          "Forgot Password",
          style: TextStyle(
            color: Colors.red,

          ),
        ));
  }

  _signInButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(1000, 60),
          backgroundColor: const Color(0XFF00C088)),
      onPressed: () {
        _formKey.currentState!.validate();
        if (signUP == true && signUp1 == true) {
          Navigator.pushNamed(context, '/third');
          signUP = signUp1 = false;
        }
        //pachadi jaanako laagi
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
          Navigator.pushNamed(context, '/second');
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.red,
          ),
        ));
  }
}
