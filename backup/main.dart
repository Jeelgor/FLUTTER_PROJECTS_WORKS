// import 'package:clg_project/login_page.dart';
// import 'package:clg_project/login_page.dart';
// import 'package:clg_project/pages/auth_page.dart';
// import 'package:clg_project/login_page.dart';
// import 'package:clg_project/pages/auth_page.dart';
// import 'package:clg_project/pages/Product_Catalog_Page.dart';
import 'package:clg_project/login_page.dart';
import 'package:clg_project/pages/Product_Catalog_Page.dart';
import 'package:clg_project/pages/Welcome_page.dart';
import 'package:clg_project/pages/addtocart.dart';
import 'package:clg_project/pages/cart_page.dart';
import 'package:clg_project/pages/nike.dart';
import 'package:clg_project/pages/orderdetail_page.dart';
import 'package:clg_project/pages/puma.dart';

// import 'package:clg_project/pages/Welcome_page.dart';
// import 'package:clg_project/pages/auth_page.dart';
// import 'package:clg_project/pages/log in_or_register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: OrderDetail(),
          // DashBoard(
          //   addToCart: (cartItem) {},
          //   cartItems: [],
          // ),
        ),
      ),
    );
  }
}
