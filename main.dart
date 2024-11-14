import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart.dart'; // Import Cart class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Cart cart = Cart(); // Initialize Cart instance here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(cart: cart), // Pass the cart instance to HomeScreen
    );
  }
}
