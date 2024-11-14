import 'package:flutter/material.dart';
import 'cart.dart'; // Import the Cart class

class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart}); // Pass the cart instance

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> cartItems = cart.getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(cartItems[index]['image']!, width: 50, height: 50),
              title: Text(cartItems[index]['name']!),
              subtitle: Text(cartItems[index]['description']!),
            ),
          );
        },
      ),
    );
  }
}
