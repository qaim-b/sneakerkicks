import 'package:flutter/material.dart';
import 'package:sneakerkicks/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/intropage.jpg'), // Replace with the actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo (Removed)

                // Text: "Welcome to SneakerKicks" (Moved higher and increased font size)
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 7), // Adjusted padding
                  child: Text(
                    "Welcome to SneakerKicks",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40, // Increased font size
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CustomCursiveFont', // Use the custom cursive font family
                      package: 'flutter',
                      color: Colors.black, // Changed to black
                    ),
                  ),
                ),

                // Text: "Discover the Latest Collection" with additional spacing
                Padding(
                  padding: const EdgeInsets.only(bottom: 20), // Adjusted padding
                  child: Text(
                    "Discover the Latest Collection",
                    style: TextStyle(
                      color: Colors.red, // Changed to red
                      fontSize: 17, // Increased font size
                    ),
                  ),
                ),

                const Spacer(), // Spacer to push content to the top and center

                // Get started button (Adjusted size and position)
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 70), // Adjusted margin to move the button slightly higher
                    width: 220, // Increased button width
                    decoration: BoxDecoration(
                      color: Colors.red, // Changed to red to match the sneaker color
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32), // Adjusted padding
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 22), // Adjusted font size
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
