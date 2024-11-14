import 'package:flutter/material.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final Map<String, String> vehicle;
  final bool showButtons; // Add this parameter

  VehicleDetailsScreen({required this.vehicle, this.showButtons = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle['name']!),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(vehicle['image']!, height: 200),
            SizedBox(height: 10),
            Text(
              vehicle['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              vehicle['description']!,
              style: TextStyle(fontSize: 16),
            ),
            if (showButtons)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                      },
                      child: Text('Add to Cart'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Buy now logic
                      },
                      child: Text('Buy Now'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
