import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:omindconsluting/Screens/Login/login_screen.dart';
import 'package:omindconsluting/Screens/Signup/components/background.dart';
import 'package:omindconsluting/Screens/Signup/components/or_divider.dart';
import 'package:omindconsluting/Screens/Signup/components/social_icon.dart';
import 'package:omindconsluting/components/already_have_an_account_acheck.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/components/rounded_input_field.dart';
import 'package:omindconsluting/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:omindconsluting/screens/dashboard/dashboard_user.dart';

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
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  Firestore.instance.collection('Users').document().setData(
                      {'email': email, 'idReference': newUser.user.uid});
                  if (newUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardUser(
                            email: newUser.user.email, uid: newUser.user.uid),
                      ),
                    );
                  }
                } catch (e) {
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
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {
                    handleSignIn().then((FirebaseUser user) {
                      Firestore.instance.collection('Users').document().setData(
                          {'email': user.email, 'idReference': user.uid});
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DashboardUser(email: user.email, uid: user.uid),
                          ),
                        );
                      }
                    }).catchError((e) => print(e));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<FirebaseUser> handleSignIn() async {
    try {
      var googleSignIn = GoogleSignIn();

      var googleSignInAccount = await googleSignIn.signIn();

      var googleSignInAuthentication = await googleSignInAccount.authentication;

      FirebaseUser firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        var credential = GoogleAuthProvider.getCredential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await _auth.signInWithCredential(credential).then((auth) {
          firebaseUser = auth.user;
        });
      }
      print(firebaseUser.email);
      return firebaseUser;
    } catch (e) {
      print("Erro $e");
      return null;
    }
  }
}
