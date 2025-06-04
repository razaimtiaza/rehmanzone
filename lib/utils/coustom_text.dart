import 'package:rehman_zone/all_imports.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final int? maxLines; // Make this nullable
  // final TextOverflow overflow;
  final TextDecoration textDecoration;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.left, // Default to right alignment for Urdu
    this.maxLines, // Allow null to enable dynamic lines
    // this.overflow = TextOverflow.ellipsis,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines, // Use the nullable maxLines
      // overflow: overflow,
    );
  }
}
