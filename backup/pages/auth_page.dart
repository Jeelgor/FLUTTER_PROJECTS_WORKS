// import 'package:clg_project/login_page.dart';
// import 'package:clg_project/login_page.dart';
// import 'package:clg_project/pages/login_or_register.dart';
import 'package:clg_project/pages/Welcome_page.dart';
import 'package:clg_project/pages/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return WelcomePage();
          }

          //user not logged in
          else {
            return LoginOrRegister(); // Fix the missing return statement
          }
        },
      ),
    );
  }
}
