import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:kookit/screens/login_screen.dart'; // Import your login screen

// Define a new screen called StartPage
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2765A2), Color(0xFF1E3B5C)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  'Welcome to Koo Kit',
                  style: GoogleFonts.kanit(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Erat placerat odio ultrices diam tristique malesuada. Faucibus eget vitae est vel sed velit elementum dapibus. Aliquam arcu urna nibh quisque quis lectus semper dictum. Aenean sit sed felis convallis imperdiet enim.',
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xFFF3F7FC),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2765A2),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.095,
                      vertical: screenHeight * 0.015), // Responsive padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  // Action when 'Continue' is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginRegisterScreen()), // Navigate to LoginScreen
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Skip',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.022),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
