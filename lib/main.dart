import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intelligentproject/src/features/authentication/screens/Description/UserDescription.dart';
import 'package:intelligentproject/src/features/authentication/screens/Login/LoginScreen.dart';
import 'package:intelligentproject/src/features/authentication/screens/SignUp/SignUp_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyDDJ_TNhy5nG9YbzACL38ccIxGnEjzFWfw",
      projectId: "minorintelligent",
      messagingSenderId: "1049338578312",
      appId: "1:1049338578312:web:056af36da2496d985ba63d",));
  runApp(const MyApp());
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
          '/second': (context) => SignUpScreen(),
          '/third' : (context) => UserDesc(),

       },
       //  home: const UserDesc(),
        debugShowCheckedModeBanner: false,
    );
  }
}
