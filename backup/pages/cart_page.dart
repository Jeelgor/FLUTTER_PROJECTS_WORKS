import 'package:clg_project/pages/Product_Catalog_Page.dart';
import 'package:clg_project/pages/addtocart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final Function(cartItem) addToCart;
  final List<cartItem> cartItems;

  // Rename the constructor parameters to avoid naming conflict
  const CartPage({
    Key? key,
    required this.addToCart,
    required this.cartItems,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget buildCartItems() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              final cartItem = widget.cartItems[index];
              return ListTile(
                title: Text(cartItem.name),
                subtitle: Text(
                  'Size: ${cartItem.size}, Quantity: ${cartItem.quantity.toStringAsFixed(2)}, Price: ${cartItem.price.toStringAsFixed(2)}',
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 311),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashBoard(
                      cartItems: widget.cartItems,
                      addToCart: widget.addToCart,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashBoard(
                      cartItems: widget.cartItems,
                      addToCart: widget.addToCart,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: buildCartItems(), // Call the buildCartItems function
    );
  }
}
