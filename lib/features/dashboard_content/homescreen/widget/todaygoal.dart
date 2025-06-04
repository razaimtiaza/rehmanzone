import 'package:rehman_zone/all_imports.dart';

class TodaysGoalWidget extends StatelessWidget {
  const TodaysGoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9, // 90% of screen width
      height: screenHeight * 0.3, // 20% of screen height
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Goal",
            style: TextStyle(
              fontSize: screenWidth * 0.05, // 5% of screen width
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_buildGoalItem(context, title: "Prayer")],
          ),
          const SizedBox(height: 10),
          _progressWidget(title: 'Quran', subtitle: 'Goal of 20 Ayahs'),
          const SizedBox(height: 10),
          _progressWidget(title: 'Duas', subtitle: 'Goal of 3 Duas'),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "View all progress",
              style: TextStyle(
                fontSize: screenWidth * 0.035, // 3.5% of screen width
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).withPaddingBottom(20).withPaddingTop(20);
  }

  Widget _progressWidget({required String title, required String subtitle}) {
    return Row(
      children: [
        // First Text
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 10), // Spacing between text and progress bar
        // Progress Bar
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Rounded edges
            child: LinearProgressIndicator(
              value: 0.5, // 50% progress
              backgroundColor: Colors.grey.shade400, // White background
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.green,
              ), // Green progress
            ),
          ),
        ),
        const SizedBox(width: 10), // Spacing between progress bar and text
        // Second Text
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildGoalItem(BuildContext context, {required String title}) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.04, // 4% of screen width
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 80),
        Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.04, // 4% of screen width
              backgroundColor: Colors.grey.shade300,
              child: Text(
                "F",
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10), // Spacing between circles
            // Circle with "D"
            CircleAvatar(
              radius: screenWidth * 0.04,
              backgroundColor: Colors.grey.shade300,
              child: Text(
                "D",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Circle with "A"
            CircleAvatar(
              radius: screenWidth * 0.04,
              backgroundColor: Colors.grey.shade300,
              child: Text(
                "A",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Circle with "M"
            CircleAvatar(
              radius: screenWidth * 0.04,
              backgroundColor: Colors.grey.shade300,
              child: Text(
                "M",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
