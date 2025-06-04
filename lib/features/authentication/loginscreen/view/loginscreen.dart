import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/authentication/provider/auth_provider.dart';
import 'package:rehman_zone/features/dashboard_content/widget/coustom_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authProvider = Provider.of<AuthenticatioProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 50,
            right: 30,
            child: CustomText(
              text: "Please Sign In to continue",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:
                  Colors
                      .white, // Use a color that contrasts with the background
            ),
          ),
          Positioned(
            top: -70, // Negative top value to overlap above the container
            left: 0,
            right: 0,
            child: Image.asset(AppImages.ellipse),
          ),
          // CustomText(text: "Please Sign In to continue"),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.8,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    hintText: 'Enter your email',
                  ),

                  const SizedBox(height: 24),

                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    hintText: 'Enter your password',
                    isPassword: true,
                  ),
                  Center(
                        child:
                            authProvider.isLoading
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                  text: "Continue",
                                  onPressed: () async {
                                    // Your logic here

                                    final email = emailController.text.trim();
                                    final password = passwordController.text;

                                    if (email.isEmpty || password.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Please fill in all fields",
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    final errorMessage = await authProvider
                                        .login(email, password);
                                    if (errorMessage == null) {
                                      // Navigate to home or dashboard
                                      Navigator.pushReplacementNamed(
                                        // ignore: use_build_context_synchronously
                                        context,
                                        AppRoutes.allahnamescreen,
                                      );
                                    } else {
                                      // Show error
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(errorMessage)),
                                      );
                                    }
                                  },
                                  color: AppColors.background,
                                  // Optional
                                ),
                      )
                      .withPaddingTop(20)
                      .withPaddingRight(40)
                      .withPaddingLeft(40)
                      .withPaddingTop(20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ), // Optional: for size
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/google.png',
                        ).withPaddingRight(20),
                        Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.black),
                        ).withPaddingRight(20),
                      ],
                    ),
                  ).withPaddingLeft(30).withPaddingRight(30).withPaddingTop(20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an Account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.registerscreen,
                            );
                          },
                          child: const Text(
                            "Sign up here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  AppColors
                                      .background, // or AppColors.primary if you have defined it
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).withPaddingTop(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
