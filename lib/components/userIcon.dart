import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  final String imagePath;
  final Color borderColor;
  final double width;
  final double height;

  const CircularProfileImage({
    Key? key,
    required this.imagePath,
    this.borderColor = Colors.white,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 3.0),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
