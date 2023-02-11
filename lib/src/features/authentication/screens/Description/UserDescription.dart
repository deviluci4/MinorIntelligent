import 'package:flutter/material.dart';

import '../../../../constants/Sizes.dart';

class UserDesc extends StatefulWidget {
  const UserDesc({Key? key}) : super(key: key);

  @override
  State<UserDesc> createState() => _UserDescState();
}

class _UserDescState extends State<UserDesc> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( body:
        Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
    child: Align(alignment: Alignment.center,
    child: Container(
    height: 350,
    width: 500,
    margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
    padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
    decoration: const BoxDecoration(
    color: Colors.white
    ),
    child: Form(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [ TextFormField(
      decoration: const InputDecoration(
        label: Text('Enter Your Description'),
        contentPadding: EdgeInsets.all(75),
        hintText: "Write As Ex- I am From canada.i love religious places",

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
      const SizedBox(height: iFormHeight-10,),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        }, child: const Text("Submit"),
      )
    ],

    ),
    )
    )
    )
    )
    );
  }
}
