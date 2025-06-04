import 'package:rehman_zone/activities/tasbih/model/tasbih_model.dart';
import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/tesbih/provider/tesbih_provider.dart';

class TesbihScreenArg {
  TasbihModel tasbihModel;
  TesbihScreenArg({required this.tasbihModel});
}

class TesbihDetailscreen extends StatelessWidget {
  const TesbihDetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as TesbihScreenArg;

    return Scaffold(
      body: Consumer<TasbihProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: AppColors.primary,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ), // Add space between cards
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ), // Round edges of the card
                ),
                elevation: 4.0,
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: CustomText(
                      text: arguments.tasbihModel.tasbihname,
                      color: AppColors.background,
                      fontSize: 20,
                    ),
                  ),
                ),
              ).withPaddingLeft(20).withPaddingRight(20),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "${value.counter}/${arguments.tasbihModel.counter}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ).withPaddingTop(20),
              GestureDetector(
                onTap: () {
                  value.countingTeshbih(arguments.tasbihModel.counter, context);
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ).withPaddingTop(20),
              ),
            ],
          );
        },
      ),
    );
  }
}
