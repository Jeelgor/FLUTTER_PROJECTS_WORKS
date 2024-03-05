// import 'dart:ffi';

import 'package:clg_project/pages/Welcome_page.dart';
import 'package:clg_project/pages/addtocart.dart';
import 'package:clg_project/pages/adidas.dart';
import 'package:clg_project/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';

class DashBoard extends StatefulWidget {
  final Function(cartItem) addToCart;
  final List<cartItem> cartItems;
  DashBoard({
    super.key,
    required this.addToCart,
    required this.cartItems,
  });

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<String> imagePaths = [
    'assets/images/nike-air-max-270-sunset.png',
    'assets/images/nike7-removebg-preview.png',
    'assets/images/nike8-removebg-preview.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: Text('Sneakers'),
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        cartItems: widget.cartItems,
                        addToCart: widget.addToCart,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_bag),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 170, top: 20),
            child: Text(
              'New Collection!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 260, top: 10),
            child: Text(
              'Nike Original 2023',
              style: TextStyle(
                  color: const Color.fromARGB(255, 195, 7, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          SizedBox(height: 20),

          //  for image load banner
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 370,
                    height: 200,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 217, 227, 234), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                      color: Color.fromARGB(255, 217, 227, 234),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 40),
                              child: Text(
                                "Nike Air Max 270", // Replace with your text
                                style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontSize: 19, // Text size
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 36, top: 10),
                              child: Text(
                                "Men's Shoe", // Replace with your text
                                style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 120, 108, 108), // Text color
                                    fontSize: 16, // Text size
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdidasPage(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              child: Text('Shop Now'),
                            )
                          ],
                        ),
                        Expanded(
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // for categories
          Padding(
            padding: const EdgeInsets.only(right: 220, top: 25),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 13),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdidasPage(),
                        ),
                      ),
                      child: Container(
                        height: 160,
                        width: 240,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 217, 227, 234),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 217, 227, 234),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/images/images.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Kids",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdidasPage(),
                        ),
                      ),
                      child: Container(
                        height: 160,
                        width: 240,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 217, 227, 234),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 217, 227, 234),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/images/images.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Men's",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdidasPage(),
                        ),
                      ),
                      child: Container(
                        height: 160,
                        width: 240,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 217, 227, 234),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 217, 227, 234),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/images/images.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Women's",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 10),
                  //           child: Container(
                  //             height: 200,
                  //             width: 370,
                  //             decoration: BoxDecoration(
                  //               border: Border.all(
                  //                 color: Color.fromARGB(
                  //                     255, 217, 227, 234), // Border color
                  //                 width: 2.0, // Border width
                  //               ),
                  //               borderRadius: BorderRadius.circular(
                  //                   20), // Adjust the radius as needed
                  //               color: Color.fromARGB(255, 217, 227, 234),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Container(
                  width: 60, // Adjust the width and height as needed
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 227, 234),
                    // You can change the background color
                    shape: BoxShape.circle, // This creates a circular shape
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdidasPage(),
                      ),
                    ),
                    child: Center(
                      child: Image.asset("assets/images/adidas.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 60, // Adjust the width and height as needed
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 227, 234),
                    // You can change the background color
                    shape: BoxShape.circle, // This creates a circular shape
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdidasPage(),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/Nike-Logo.png",
                          height: 100,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 60, // Adjust the width and height as needed
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 227, 234),
                    // You can change the background color
                    shape: BoxShape.circle, // This creates a circular shape
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdidasPage(),
                      ),
                    ),
                    child: Center(
                        child: Image.asset(
                      "assets/images/puma.png",
                      height: 30,
                      width: 80,
                    )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 60, // Adjust the width and height as needed
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 227, 234),
                    // You can change the background color
                    shape: BoxShape.circle, // This creates a circular shape
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdidasPage(),
                      ),
                    ),
                    child: Center(
                        child: Image.asset(
                      "assets/images/Reebok-logo.png",
                      height: 75,
                      width: 40,
                    )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 60, // Adjust the width and height as needed
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 227, 234),
                    // You can change the background color
                    shape: BoxShape.circle, // This creates a circular shape
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdidasPage(),
                      ),
                    ),
                    child: Center(
                        child: Image.asset(
                      "assets/images/Fila-Logo.png",
                      width: 50,
                      height: 40,
                    )),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 50,
          ),
// CART BTN
          Padding(
            padding: const EdgeInsets.only(right: 50, top: 22, left: 40),
            child: Container(
              height: 60,
              width: 340,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius:
                    BorderRadius.circular(20), // Adjust the radius as needed
                color: Color.fromARGB(255, 121, 119, 119),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage(
                              cartItems: widget.cartItems,
                              addToCart: (cartItems) {},
                            )),
                  );
                },
                icon: Icon(
                  Icons.shopping_bag,
                  size: 34,
                ),
              ),
            ),
          ),
          // CART BTN  CLOSE
        ],
      ),
    );
  }
}
