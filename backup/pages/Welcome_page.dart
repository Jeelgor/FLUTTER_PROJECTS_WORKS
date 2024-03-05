import 'package:clg_project/pages/auth_page.dart';
import 'package:flutter/material.dart';
// import 'package:clg_project/pages/Product_Catalog_Page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 51, 51, 51),
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     // Add your logout logic here if needed.
          //   },
          //   // icon: Icon(Icons.logout),
          // ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Image.asset(
            'assets/images/img1.jpg',
            height: 400,
          ),
          const Text(
              '_________________________________________________________________'),
          SizedBox(height: 80),
          SizedBox(height: 40),

          /// button shop for move to the next page
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthPage(),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(25),
              child: const Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
