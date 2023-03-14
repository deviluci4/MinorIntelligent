import 'dart:js';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:intelligentproject/Provider.dart';
import 'package:intelligentproject/View%20Page/View_Page.dart';
import 'package:intelligentproject/src/features/authentication/screens/Description/UserDescription.dart';
import 'package:intelligentproject/src/features/authentication/screens/Login/LoginScreen.dart';
import 'package:intelligentproject/src/features/authentication/screens/SignUp/SignUp%20Screen.dart';
import 'package:provider/provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyApqpWb5FCKCogQ-zIR2qyAJVduCNNLaa4",
        appId: "1:980296288628:android:386c4ca3b10d9ca9f7c421",
        messagingSenderId: "980296288628",
        projectId: "khaki-2afa6")
  );

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => DataProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
       initialRoute: '/',
        routes: {
          '/': (context) => MyLoginPage(),
          '/second': (context) => SignUp(),
          '/third' : (context) => UserDEsc(),
          '/fourth' : (context)=> view_Page(),

       },
       //  home: const UserDesc(),
        debugShowCheckedModeBanner: false,
    );
  }
}
