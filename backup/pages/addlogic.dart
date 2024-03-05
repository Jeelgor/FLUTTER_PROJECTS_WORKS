// import 'dart:js_util';

import 'package:flutter/material.dart';

class Addtocart extends StatelessWidget {
  const Addtocart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('add to cart'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                "assets/images/nike-remove.png",
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                "Nike Air Max",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "kjdvsv mklw  mfjeov w emfklw nv vnoi fmfmv orgvmgv vmedwpvp",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 310),
              child: Text("size",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                    child: Center(
                        child: Text('6',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                    child: Center(
                        child: Text('7',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                    child: Center(
                        child: Text('8',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                    child: Center(
                        child: Text('9',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                    child: Center(
                        child: Text('10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Photos",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          7), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      Text(
                        "3000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 230,
                    child: ElevatedButton(
                      onPressed: () {
                        // HERE IS ADD TO CART LOGIC
                      },
                      child: Text(
                        'add to cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
  