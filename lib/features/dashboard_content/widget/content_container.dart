import 'package:rehman_zone/all_imports.dart';

class CustomContentContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final int id;
  final double titleFontSize;
  final double subtitleFontSize;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight titleFontWeight;

  // New parameter to accept a list of icon buttons
  final List<Widget> topIcons;

  const CustomContentContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.id,
    this.titleFontSize = 17,
    this.subtitleFontSize = 13,
    this.backgroundColor = AppColors.cardcolor,
    this.textColor = AppColors.background,
    this.titleFontWeight = FontWeight.bold,
    required this.topIcons, // Require the list of icons
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.04,
      height: context.screenWidth * 0.6, // Use calculated height
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          topContent(id), // Call the method to display top icons
          Flexible(
            // Keep the title fixed
            child: CustomText(
              text: title,
              fontSize: titleFontSize,
              color: textColor,
              fontWeight: titleFontWeight,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8.0), // Add space between title and subtitle
          Expanded(
            // Allow the subtitle to take remaining space
            child: SingleChildScrollView(
              child: CustomText(
                text: subtitle,
                fontSize: subtitleFontSize,
                color: textColor,
                textAlign: TextAlign.center,
                maxLines: null,
              ),
            ),
          ),
        ],
      )
          .withPaddingLeft(context.screenWidth * 0.02)
          .withPaddingRight(context.screenWidth * 0.02),
    );
  }

  Widget topContent(int id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.background,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text("$id",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Distribute icons evenly
          children: topIcons,
        ),
      ],
    );
  }
}
