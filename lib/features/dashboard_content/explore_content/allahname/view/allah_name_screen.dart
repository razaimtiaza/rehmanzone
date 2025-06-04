import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/allahname/provider/allah_name_provider.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/allahname/widget/allahname_daliogbox.dart';

class AllahNameScreen extends StatelessWidget {
  const AllahNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Allah Names")),
      body: Consumer<AllahNameProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: provider.allahnameList.length,
            itemBuilder: (context, index) {
              final allahname = provider.allahnameList[index];
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (_) => AllahNameDialog(
                          allahNames: provider.allahnameList,
                          initialIndex: index,
                        ),
                  );
                },
                child: Card(
                  color: AppColors.primary,
                  elevation: 4,
                  child: Center(
                    child: CustomText(
                      text: allahname.arabic,
                      color:
                          AppColors
                              .background, // Correctly accessing topic name
                    ),
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
