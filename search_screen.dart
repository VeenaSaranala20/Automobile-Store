import 'package:flutter/material.dart';
import 'cart.dart'; // Import the Cart class

class SearchScreen extends StatelessWidget {
  final Cart cart;

  SearchScreen({required this.cart}); // Pass the cart instance

  @override
  Widget build(BuildContext context) {
    // Example vehicles for search results
    List<Map<String, String>> cars = [
      {
        "name": "SUV",
        "image": "assets/car1.jpeg",
        "description": "A powerful and versatile SUV that can handle rough terrains with ease."
      },
      {
        "name": "Sedan",
        "image": "assets/car2.jpg",
        "description": "A sleek and stylish sedan with premium interiors and great fuel efficiency."
      },
      {
        "name": "Electric",
        "image": "assets/car3.jpeg",
        "description": "An eco-friendly electric vehicle that offers cutting-edge technology and zero emissions."
      },
      {
        "name": "Truck",
        "image": "assets/car1.jpeg",
        "description": "A rugged and reliable truck built for heavy loads and tough jobs."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Vehicles'),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(cars[index]['image']!, width: 50, height: 50),
                    title: Text(cars[index]['name']!),
                    subtitle: Text(cars[index]['description']!),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          cart.addItem(cars[index]); // Add to cart
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${cars[index]['name']} added to cart')),
                          );
                        },
                        child: Text('Add to Cart'),
                      ),
                      SizedBox(width: 8), // Space between buttons
                      ElevatedButton(
                        onPressed: () {
                          // Buy now logic (directly proceed to checkout or similar action)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Proceeding to buy ${cars[index]['name']}')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Set color for Buy Now button
                        ),
                        child: Text('Buy Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
