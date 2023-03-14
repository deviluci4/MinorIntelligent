import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intelligentproject/Provider.dart';
import 'package:provider/provider.dart';


import '../../../../constants/Sizes.dart';

class UserDEsc extends StatefulWidget {
  const UserDEsc({Key? key}) : super(key: key);

  @override
  State<UserDEsc> createState() => _UserDEscState();
}

class _UserDEscState extends State<UserDEsc> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();


  dynamic _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final description = _descriptionController.text.trim();
      final url = 'http://localhost:4000/compile'; // Replace with your server URL
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({'message': description});

      final response = await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        final processedData = jsonDecode(response.body);
        // Handle the processed data
        print(processedData);
        return processedData;
      } else {
        // Handle error response
        print('API request failed with status code: ${response.statusCode}');
        return false;
      }
    }else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold( body:
    Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/sylwia-bartyzel-FuuEdB1XN4M-unsplash (1).jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(alignment: Alignment.center,
            child: Container(
                height: 350,
                width: 500,
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
                padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
                decoration: const BoxDecoration(
                    color: Colors.white70
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        label: Text('Enter Your Description'),
                        contentPadding: EdgeInsets.all(75),
                        hintText: "Write As Ex- I am From canada.i love Treeking",

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
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                      const SizedBox(height: iFormHeight-10,),
                      ElevatedButton(
                        onPressed: () async {
                          var receivedData = await _submitForm();
                          print(receivedData);
                          if(receivedData != true) {
                            context.read<DataProvider>().modifyData(receivedData);
                            Navigator.pushNamed(context, '/fourth');
                          }
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

