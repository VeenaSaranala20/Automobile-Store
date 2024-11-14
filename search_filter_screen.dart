import 'package:flutter/material.dart';
import 'vehicle_details_screen.dart';
import 'cart.dart'; // Import Cart class

class SearchFilterScreen extends StatefulWidget {
  final Cart cart; // Accept a cart instance

  const SearchFilterScreen({Key? key, required this.cart}) : super(key: key);

  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  List<Map<String, String>> filteredCars = [
    {"name": "SUV", "image": "assets/car1.jpeg"},
    {"name": "Sedan", "image": "assets/car2.jpg"},
    {"name": "Electric", "image": "assets/car3.jpeg"},
    {"name": "Truck", "image": "assets/car1.jpeg"},
  ];

  String selectedType = 'All';
  double selectedPrice = 50;
  String selectedFuel = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search & Filter Vehicles'),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search vehicles...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(filteredCars[index]['image']!, height: 100),
                      SizedBox(height: 10),
                      Text(
                        filteredCars[index]['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.cart.addItem(filteredCars[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${filteredCars[index]['name']} added to cart!'),
                            ),
                          );
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Filter Options'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    items: ['All', 'SUV', 'Sedan', 'Truck', 'Electric']
                        .map((type) => DropdownMenuItem(
                      child: Text(type),
                      value: type,
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Vehicle Type'),
                  ),
                  Slider(
                    value: selectedPrice,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: 'Max Price: \$${selectedPrice.toInt()}',
                    onChanged: (value) {
                      setState(() {
                        selectedPrice = value;
                      });
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedFuel,
                    items: ['All', 'Petrol', 'Diesel', 'Electric']
                        .map((fuel) => DropdownMenuItem(
                      child: Text(fuel),
                      value: fuel,
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFuel = value!;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Fuel Type'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      filterCars();
                      Navigator.pop(context);
                    });
                  },
                  child: Text('Apply Filters'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void filterCars() {
    setState(() {
      filteredCars = filteredCars.where((car) {
        final typeMatches = selectedType == 'All' || car['type'] == selectedType;
        final priceMatches = double.parse(car['price']!) <= selectedPrice;
        final fuelMatches = selectedFuel == 'All' || car['fuel'] == selectedFuel;

        return typeMatches && priceMatches && fuelMatches;
      }).toList();
    });
  }
}
