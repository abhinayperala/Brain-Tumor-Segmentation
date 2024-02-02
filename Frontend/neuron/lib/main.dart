import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:neuron/videopickerwidget.dart';
import 'splash.dart';
import 'phone.dart';
import 'otp.dart';
import 'login.dart';
import 'signup.dart';
import 'reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neuron App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/phone': (context) => MyPhone(),
        '/otp': (context) => MyOtp(),
        '/login': (context) => LoginPage(),
        '/video' : (context) => VideoPickerWidget(),
        '/signup': (context) => SignupPage(),
        '/reset_password': (context) => ResetPasswordPage(),
        // Add other routes here if needed
      },
    );
  }
}
