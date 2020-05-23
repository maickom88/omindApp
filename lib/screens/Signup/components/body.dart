import 'package:flutter/material.dart';
import 'package:omindconsluting/Screens/Login/login_screen.dart';
import 'package:omindconsluting/Screens/Signup/components/background.dart';
import 'package:omindconsluting/Screens/Signup/components/or_divider.dart';
import 'package:omindconsluting/Screens/Signup/components/social_icon.dart';
import 'package:omindconsluting/components/already_have_an_account_acheck.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/components/rounded_input_field.dart';
import 'package:omindconsluting/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omindconsluting/screens/Dashboard.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/mindlogo.jpg",
              height: size.height * 0.2,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
//                Navigator.pushNamed(context, MenuDashboardPage.id);
//              print(email);
//              print(password);
             try{
               final newUser = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
               if(newUser != null){
                   Navigator.pushNamed(context, MenuDashboardPage.id);
               }
             }catch(e){
               print(e);
             }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
