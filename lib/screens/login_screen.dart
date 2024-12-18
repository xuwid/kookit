import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kookit/widgets/loginlogoW.dart'; // Import for your logo widget

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  bool _obscurePassword = true; // Toggles password visibility

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Scaling factors
    double widthFactor = screenWidth / 375; // Base width scaling
    double heightFactor = screenHeight / 667; // Base height scaling

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.all(16 * widthFactor),
          color: const Color(0xFF14273D), // Background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20 * heightFactor),
              // Logo Section
              const ClippedImageContainer(
                widthPercentage: 0.6,
                heightPercentage: 0.1,
                imagePath: 'lib/assets/loginlogo.jpg',
              ),
              SizedBox(height: 24 * heightFactor),

              // Login / Register Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton("Login", context, widthFactor, heightFactor),
                  SizedBox(width: 16 * widthFactor),
                  _buildButton("Register", context, widthFactor, heightFactor),
                ],
              ),

              Container(
                padding: EdgeInsets.all(24 * widthFactor),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2765A2), Color(0xFF1E3B5C)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Email Field
                    _buildInputField(
                      "Email",
                      context,
                      widthFactor,
                      heightFactor,
                      isPassword: false,
                    ),
                    SizedBox(height: 16 * heightFactor),

                    // Password Field with Show/Hide Password Icon
                    _buildInputField(
                      "Password",
                      context,
                      widthFactor,
                      heightFactor,
                      isPassword: true,
                    ),
                    SizedBox(height: 24 * heightFactor),

                    // Login Button
                    _buildLoginButton('Login', widthFactor, heightFactor),
                    SizedBox(height: 16 * heightFactor),

                    // Forgot Password and Register Links
                    GestureDetector(
                      onTap: () {
                        // Add forgot password logic here
                      },
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 14 * widthFactor,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 8 * heightFactor),
                    Row(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 14 * widthFactor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to register screen
                          },
                          child: Text(
                            "Register here",
                            style: GoogleFonts.mulish(
                              color: Colors.white,
                              fontSize: 14 * widthFactor,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16 * heightFactor),
              Text(
                "Or login using",
                style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontSize: 14 * widthFactor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16 * heightFactor),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton("Google", widthFactor, heightFactor),
                  SizedBox(width: 16 * widthFactor),
                  _buildSocialButton("Facebook", widthFactor, heightFactor),
                  SizedBox(width: 16 * widthFactor),
                  _buildSocialButton("Apple", widthFactor, heightFactor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Input Fields with Show Password Feature
  Widget _buildInputField(String placeholder, BuildContext context,
      double widthFactor, double heightFactor,
      {bool isPassword = false}) {
    return Container(
      width: 313 * widthFactor,
      height: 48 * heightFactor,
      padding: EdgeInsets.symmetric(horizontal: 16 * widthFactor),
      decoration: BoxDecoration(
        color: const Color(0xFF357CBA),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Center(
        child: TextField(
          obscureText:
              isPassword ? _obscurePassword : false, // Show/Hide password
          style: GoogleFonts.mulish(
            fontSize: 16 * widthFactor,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.mulish(
              fontSize: 16 * widthFactor,
              color: Colors.white70,
            ),
            border: InputBorder.none,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: widthFactor * 18,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }

  // Build Rounded Buttons for Login/Register
  Widget _buildButton(String text, BuildContext context, double widthFactor,
      double heightFactor) {
    return Container(
      width: 138 * widthFactor,
      height: 38 * heightFactor,
      decoration: BoxDecoration(
        color: const Color(0xFF357CBA),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: const Color(0xFF2765A2), width: 3),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.mulish(
            fontWeight: FontWeight.w900,
            fontSize: 18 * widthFactor,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Build Social Buttons for Google/Facebook/Apple
  Widget _buildSocialButton(
      String platform, double widthFactor, double heightFactor) {
    double size = 30 * widthFactor;
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(
          'lib/assets/${platform.toLowerCase()}.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Build Login Button
  Widget _buildLoginButton(
      String platform, double widthFactor, double heightFactor) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * widthFactor,
        vertical: 10 * heightFactor,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF357CBA),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        platform,
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.w700,
          fontSize: 17 * widthFactor,
          color: Colors.white,
        ),
      ),
    );
  }
}
