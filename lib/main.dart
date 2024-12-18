import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:kookit/screens/language_preference_screen.dart'; // Import your language preference screen
import 'dart:async'; // To use Future.delayed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KooKit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          titleMedium: GoogleFonts.inter(), // Using GoogleFonts
        ),
      ),
      home: SplashScreen(), // Set the home screen to SplashScreen
    );
  }
}

// Splash Screen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds before navigating to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the LanguagePreferenceScreen after delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LanguagePreferenceScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2765A2),
              Color(0xFF1E3B5C)
            ], // Match your image background
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            'lib/assets/splash.jpg', // Ensure your logo is placed in the 'assets' folder
            width: screenWidth * 0.6, // Adjust width for responsiveness
            height: screenHeight * 0.5, // Adjust height for responsiveness
            fit: BoxFit.contain, // Keep the image proportions
          ),
        ),
      ),
    );
  }
}
