import 'package:rehman_zone/all_imports.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for grid items
    final List<Map<String, String>> gridItems = [
      {"image": "asset/images/gridimage.png", "text": "99 Names of Allah"},
      {
        "image": "asset/images/gridimage.png",
        "text": "99 Names of Holy Prophet (PBUH)"
      },
      {"image": "asset/images/gridimage.png", "text": " How to Pray "},
      {"image": "asset/images/gridimage.png", "text": "Daily Duas"},
      {"image": "asset/images/gridimage.png", "text": "Quranic Inspiration"},
      {
        "image": "asset/images/gridimage.png",
        "text": "Finality of Prophethood"
      },
      {"image": "asset/images/gridimage.png", "text": "Wazaif"},
    ];

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the grid
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            mainAxisSpacing: 16, // Vertical spacing between rows
            crossAxisSpacing: 16, // Horizontal spacing between columns
            childAspectRatio: 0.8, // Adjust aspect ratio to fit image & text
          ),
          itemBuilder: (context, index) {
            final item = gridItems[index];
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.allahnamescreen,
                    // Pass the SurahModel
                  );
                } else if (index == 3) {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.duascreen,
                    // Pass the SurahModel
                  );
                } else if (index == 4) {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.inspirationscreen,
                    // Pass the SurahModel
                  );
                }
              },
              child: CustomGridItem(
                imagePath: item["image"]!,
                text: item["text"]!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomGridItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomGridItem({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,

                height: 80, // Adjust image height as needed
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
