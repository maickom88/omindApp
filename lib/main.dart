import 'package:flutter/material.dart';
import 'package:omindconsluting/screens/Dashboard.dart';
import 'package:omindconsluting/screens/Login/login_screen.dart';
import 'package:omindconsluting/screens/Signup/signup_screen.dart';
import 'screens/Welcome/welcome_screen.dart';
import 'package:omindconsluting/constants.dart';
import 'package:omindconsluting/screens/Welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Omind Consulting",
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        SignUpScreen.id : (context) => SignUpScreen(),
        LoginScreen.id  : (context) => LoginScreen(),
        MenuDashboardPage.id : (context) => MenuDashboardPage(),


      },
    );
  }
}
