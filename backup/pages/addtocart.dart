import 'package:clg_project/pages/cart_page.dart';
import 'package:flutter/material.dart';

class cartItem {
  final String name;
  final double price;
  final String size;
  final double quantity;

  cartItem({
    required this.name,
    required this.price,
    required this.size,
    required this.quantity,
  });
}

class Addtocart extends StatefulWidget {
  const Addtocart({Key? key}) : super(key: key);

  @override
  _AddtocartState createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  String selectedSize = '6';
  int quantity = 1;
  double productPrice = 3000.0;
  List<cartItem> cartItems = [];

  Widget sizeButton(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedSize == size
                ? Colors.blue
                : Color.fromARGB(255, 217, 227, 234),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(7),
          color: Color.fromARGB(255, 217, 227, 234),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }

  void addToCart() {
    cartItem item = cartItem(
      name: "Nike Air Max",
      size: selectedSize,
      quantity: quantity.toDouble(),
      price: productPrice * quantity.toDouble(),
    );

    setState(() {
      cartItems.add(item);
    });

    // Navigate to the cart page
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => CartPage(
    //       addToCart: (cartItem) {},
    //       cartItems: cartItems, // Pass it as a named argument
    //     ),
    //   ),
    // );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Added to Cart"),
          content: Text("Item added to the cart."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    setState(() {
      selectedSize = '6';
      quantity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add to Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        // cartItems: cartItems,
                        addToCart: (cartItem) {},
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Image
          Container(
            height: 200,
            child: Image.asset(
              "assets/images/nike-remove.png",
              height: 300,
            ),
          ),

          // Product Name
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Nike Air Max",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),

          // Product Description
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Description: kjdvsv mklw mfjeov w emfklw nv vnoi fmfmv orgvmgv vmedwpvp",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),

          // Size selection buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              sizeButton('6'),
              sizeButton('7'),
              sizeButton('8'),
              sizeButton('9'),
              sizeButton('10'),
            ],
          ),

          // Quantity selection
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
                icon: Icon(Icons.remove),
              ),
              Text(
                quantity.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),

          // Add to Cart button
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    Text(
                      (productPrice * quantity.toDouble()).toStringAsFixed(2),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: addToCart,
                    child: Text(
                      'Add to Cart',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
