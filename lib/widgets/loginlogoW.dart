import 'package:flutter/material.dart';

class ClippedImageContainer extends StatelessWidget {
  final double widthPercentage;
  final double heightPercentage;
  final String imagePath;

  const ClippedImageContainer({
    Key? key,
    required this.widthPercentage,
    required this.heightPercentage,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(6),
        width: screenWidth * widthPercentage,
        height: screenHeight * heightPercentage,
        decoration: BoxDecoration(
          color: const Color(0xFF205084),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
