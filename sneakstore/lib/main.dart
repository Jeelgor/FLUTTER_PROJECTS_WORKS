import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sneakstore/auth_page.dart';
import 'package:sneakstore/firebase_options.dart';
import 'package:sneakstore/home_page.dart';
import 'package:sneakstore/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(
    MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AuthPage(),
        ),
      ),
    );
  }
}
