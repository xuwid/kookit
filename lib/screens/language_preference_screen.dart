import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kookit/screens/start_page.dart'; // Import Google Fonts package

class LanguagePreferenceScreen extends StatefulWidget {
  @override
  _LanguagePreferenceScreenState createState() =>
      _LanguagePreferenceScreenState();
}

class _LanguagePreferenceScreenState extends State<LanguagePreferenceScreen> {
  ExpansionTileController etc =
      ExpansionTileController(); // ExpansionTileController for ExpansionTile
  // Define the list of languages
  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian'
  ];
  String? selectedLanguage; // Store the selected language

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Scale factor for text size based on screen width
    double scaleFactor = screenWidth /
        375; // 375 is the base width for small screens (like iPhone 6)

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: screenHeight, // Keep the height flexible
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
              // Language Preference Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  'Language Preference',
                  style: GoogleFonts.kanit(
                    fontWeight: FontWeight.w600,
                    fontSize: 24 * scaleFactor, // Responsive font size
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Language Input Field (ExpansionTile)
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.03,
                    horizontal: screenWidth * 0.05),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(56),
                  child: Container(
                    // Set a fixed height when collapsed and flexible when expanded
                    height: selectedLanguage == null
                        ? null // Height when collapsed
                        : null, // Height adjusts automatically when expanded
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56),
                      ),
                      controller: etc,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      title: Text(
                        selectedLanguage ?? 'Select Language',
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w400,
                          fontSize: 16 * scaleFactor,
                          color: Color(0xFFF3F7FC),
                        ),
                      ),
                      backgroundColor: Color(0xFF2765A2),
                      collapsedBackgroundColor: Color(0xFF357CBA),
                      initiallyExpanded:
                          false, // Ensure it's initially collapsed
                      //nsure no extra padding inside when expanded
                      //Disable the default divider color
                      children: languages
                          .where((language) =>
                              language !=
                              selectedLanguage) // Exclude the selected language
                          .map((language) {
                        return Container(
                          color: Colors
                              .transparent, // Remove any unwanted background
                          child: ListTile(
                            title: Text(
                              language,
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 16 * scaleFactor,
                                color: Color(0xFFF3F7FC),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedLanguage = language;
                                etc.collapse(); // Collapse the tile when a language is selected
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              // Continue Button
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: ElevatedButton(
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
                    // Implement what happens when the user presses Continue
                    if (selectedLanguage != null) {
                      // You can navigate to another screen or do some action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartPage()),
                      );

                      print('Selected language: $selectedLanguage');
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Continue',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18 * scaleFactor,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
