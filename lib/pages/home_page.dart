import 'package:flutter/material.dart';
import 'package:sneakerkicks/pages/cart_page.dart';

class Sneaker {
  final String name;
  final String imageUrl;
  final double price; // Add the price property

  Sneaker({required this.name, required this.imageUrl, required this.price});
}

class HomePage extends StatelessWidget {
  final List<Sneaker> sneakers = [
    Sneaker(name: "Air Jordan Low Concord", imageUrl: "lib/images/Air Jordan Low Concord.jpg", price: 120),
    Sneaker(name: "Air Jordan Low Flyease Red", imageUrl: "lib/images/Air Jordan Low Flyease Red.jpg", price: 140),
    Sneaker(name: "Air Jordan Low Lakers Vibes", imageUrl: "lib/images/Air Jordan Low Lakers Vibes.jpg", price: 100),
    Sneaker(name: "Air Jordan Low Pandas", imageUrl: "lib/images/Air Jordan Low Pandas.jpg", price: 120),
    Sneaker(name: "Air Jordan Low Smoke Grey", imageUrl: "lib/images/Air Jordan Low Smoke Grey.jpg", price: 120),
    Sneaker(name: "Air Jordan Low Travis Scott", imageUrl: "lib/images/Air Jordan Low Travis Scott.jpg", price: 280),
    Sneaker(name: "Air Jordan Low University Blue", imageUrl: "lib/images/Air Jordan Low University Blue.jpg", price: 140),
    Sneaker(name: "Air Jordan Lows Iced Lilac", imageUrl: "lib/images/Air Jordan Lows Iced Lilac.jpg", price: 120),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SneakerKicks"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue, Colors.deepPurple], // Adjust colors as desired
          ),
        ),
      ),
     ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two sneakers per row
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: sneakers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tapping on a sneaker to show more details or navigate to a detailed page
              // For simplicity, we'll just show a snackbar with the sneaker name for now.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Selected: ${sneakers[index].name}"),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    sneakers[index].imageUrl,
                    width: 200,
                    height: 125.5,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text(
                    sneakers[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "\$${sneakers[index].price.toStringAsFixed(2)}", // Display the price
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(cartItems: [])), // Pass the cartItems list here
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
