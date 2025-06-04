import 'package:rehman_zone/all_imports.dart';

class PrahScreen extends StatelessWidget {
  const PrahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrahProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (viewModel.error != null) {
          return Center(child: Text('Error: ${viewModel.error}'));
        }

        return ListView.builder(
          itemCount: viewModel.prah.length,
          itemBuilder: (context, index) {
            final parh = viewModel.prah[index];
            return ListTile(
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
                      child: Text('${parh.id}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 16), // Space between ID and names
                  Expanded(
                    child: CustomText(
                      text: parh.englishName,
                      color: AppColors.background,
                      fontSize: 16,
                    ),
                  ) // Expand to use available space
                ],
              ),
              trailing: CustomText(
                text: parh.arabicName,
                color: AppColors.background,
                fontSize: 17,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.prahdetail,
                  arguments: PrahDetailScreenArg(
                      prahModel: parh), // Pass the SurahModel
                );
              }, // Arabic name as subtitle
            );
          },
        );
      },
    );
  }
}
