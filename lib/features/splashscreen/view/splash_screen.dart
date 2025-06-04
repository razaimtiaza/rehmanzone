import 'package:rehman_zone/all_imports.dart';

/// ugiu iug igig iug iug
/// uig iug iug
/// io oi iouoiu oiu joi
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false)
        .navigateToNextScreen(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.splashbackground),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                top: context.screenHeight * 0.17,
                left: context.screenHeight * 0.03,
                right: context.screenHeight * 0.03,
                child: Image.asset(AppImages.logo)),
            const Center(
              child: CustomText(
                text: AppConstant.splashtext,
                color: Colors.white,
                fontSize: 20,
                maxLines: 2,
              ),
            ),
            Positioned(
              left: context.screenHeight * 0.03,
              right: context.screenHeight * 0.03,
              bottom: context.screenHeight * 0.14,
              child: const Center(
                child: CustomText(
                  text: AppConstant.loading,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
