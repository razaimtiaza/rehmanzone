import 'package:firebase_auth/firebase_auth.dart';
import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/authentication/provider/auth_provider.dart';

import 'package:rehman_zone/features/dashboard_content/widget/coustom_input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confrimpassword = TextEditingController();
    final authprovider = Provider.of<AuthenticatioProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                AppImages.ellipse,
                height: 150, // optional height
              ),
            ),
          ),

          Positioned(
            top: 60,
            left: 50,
            right: 30,
            child: CustomText(
              text: "Please Sign Up to continue",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:
                  Colors
                      .white, // Use a color that contrasts with the background
            ),
          ),

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
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Confrim Password',
                    controller: confrimpassword,
                    hintText: 'Enter your password',
                    isPassword: true,
                  ),
                  Center(
                    child:
                        authprovider.isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                              text: "SignUp",
                              onPressed: () async {
                                // Your logic here
                                // Navigator.pushNamed(context, AppRoutes.loginscreen);
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();
                                final confirmPassword =
                                    confrimpassword.text.trim();

                                if (email.isEmpty ||
                                    password.isEmpty ||
                                    confirmPassword.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("All fields are required"),
                                    ),
                                  );
                                  return;
                                }

                                if (password != confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Passwords do not match"),
                                    ),
                                  );
                                  return;
                                }

                                final errorMessage = await authprovider
                                    .register(email, password);

                                if (errorMessage != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(errorMessage)),
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.loginscreen,
                                  );
                                }
                              },
                              color: AppColors.background,
                              // Optional
                            ),
                  ).withPaddingTop(20).withPaddingRight(40).withPaddingLeft(40),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.loginscreen);
                          },
                          child: const Text(
                            "Sign in ",
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
