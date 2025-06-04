import "package:flutter/material.dart";

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const CustomCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 78,
          height: 74,
          decoration: BoxDecoration(
            color: Colors.white, // ARGB color for #FFFFFF48
            borderRadius: BorderRadius.circular(12), // Optional rounded corners
          ),
          child: Image.asset(imagePath),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}
