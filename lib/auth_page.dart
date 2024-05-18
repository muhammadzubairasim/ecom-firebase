import 'package:ecom/features/authentication/screen/Login_Screen.dart';
import 'package:ecom/features/shop/screen/Home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user loggin in
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return Login_Screen();
        }
      },
    ));
  }
}
