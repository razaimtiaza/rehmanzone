import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/tesbih/provider/tesbih_provider.dart';
import 'package:rehman_zone/features/dashboard_content/tesbih/view/tesbih_detailscreen.dart';

class TesbihScreen extends StatelessWidget {
  const TesbihScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Tesbih")),
      ),
      body: Consumer<TasbihProvider>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0), // Add padding around the list
            itemCount: viewModel.tasbihList.length,
            itemBuilder: (context, index) {
              final surah = viewModel.tasbihList[index];
              return Card(
                color: AppColors.primary,
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0), // Add space between cards
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(16.0), // Round edges of the card
                ),
                elevation: 4.0, // Add shadow to the card
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('${surah.id}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 16), // Space between ID and names
                      Expanded(
                        child: CustomText(
                          text: surah.tasbihname,
                          color: AppColors.background,
                          fontSize: 16,
                        ),
                      ) // Expand to use available space
                    ],
                  ),
                  trailing: CustomText(
                    text: "${surah.counter}",
                    color: AppColors.background,
                    fontSize: 17,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.tesbihdetailscreen,
                      arguments: TesbihScreenArg(
                          tasbihModel: surah), // Pass the SurahModel
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
