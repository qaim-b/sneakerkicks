import 'package:flutter/material.dart';

class Sneaker {
  final String name;
  final double price;
  final String imageUrl;

  Sneaker({required this.name, required this.price, required this.imageUrl});
}

class CartPage extends StatelessWidget {
  final List<Sneaker> cartItems;

  CartPage({required this.cartItems});

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (Sneaker item in cartItems) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  void removeFromCart(int index) {
    // Implement your logic to remove the item from the cart
    // For simplicity, we'll just print the item name here
    print("Removed from cart: ${cartItems[index].name}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              cartItems[index].imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(cartItems[index].name),
            subtitle: Text("\$${cartItems[index].price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeFromCart(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Item removed from cart."),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total: \$${calculateTotalPrice().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
