import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  // If you need to pass parameters, declare them here.
  // For example: final Cart cart;

  // PaymentScreen({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Center(
        child: Text('Payment Screen Content Here'),
      ),
    );
  }
}
