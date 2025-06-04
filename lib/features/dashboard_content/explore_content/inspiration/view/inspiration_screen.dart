import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/inspiration/provider/inspiration_provider.dart';

class InspirationScreen extends StatelessWidget {
  const InspirationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inspiration Quotes")),
      body: Consumer<InspirationProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.duaList.length,
            itemBuilder: (context, index) {
              final dua = provider.duaList[index];
              return Card(
                color: AppColors.primary,
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(dua.urdu,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 20, color: AppColors.background)),
                      const SizedBox(height: 8),
                      CustomText(
                        text: dua.english,
                        color: AppColors.background,
                      ),
                      Text(dua.sournce,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.background)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
