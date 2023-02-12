import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/Sizes.dart';
import '../../../../constants/text_Strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.all(iDefaultSize),
            color: Colors.blueGrey,
            child: Column(
              children: [
                const FormHeaderWidget(
                  title: iSignUpTitle,
                  subTitle: iSignUpSubtitle, image: ' ',
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: iFormHeight-10),
                  child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Full Name'),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                color: Color(0xFF272727),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF272727)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2.0, color: Color(0xFF272727))
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Email'),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xFF272727),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF272727)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2.0, color: Color(0xFF272727))
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Password'),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.fingerprint,
                                color: Color(0xFF272727),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF272727)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2.0, color: Color(0xFF272727))
                              ),
                            ),
                          ),
                          const SizedBox(height: iFormHeight-10,),
                          ElevatedButton(
                            onPressed: () {}, child: const Text("Sign Up"),
                          )
                        ],
                      )
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

