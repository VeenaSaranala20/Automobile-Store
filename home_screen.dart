import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'cart_screen.dart';
import 'cart.dart'; // Import Cart class
import 'vehicle_details_screen.dart'; // Import VehicleDetailsScreen
import 'payment_screen.dart'; // Import the PaymentScreen

class HomeScreen extends StatefulWidget {
  final Cart cart; // Add a cart parameter

  HomeScreen({required this.cart}); // Accept cart instance

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Store'),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: _selectedIndex == 0
          ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicleDetailsScreen(
                    vehicle: cars[index],
                    showButtons: false,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(cars[index]['image']!, height: 100),
                  SizedBox(height: 10),
                  Text(
                    cars[index]['name']!,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      )
          : _selectedIndex == 1
          ? SearchScreen(cart: widget.cart)
          : _selectedIndex == 2
          ? CartScreen(cart: widget.cart)
          : PaymentScreen(), // Make sure PaymentScreen doesn't require parameters
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blueGrey[900],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'), // New Payment Item
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Handle navigation for other tabs
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchScreen(cart: widget.cart)),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartScreen(cart: widget.cart)),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentScreen()), // Ensure correct instantiation
            );
          }
        },
      ),
    );
  }
}
