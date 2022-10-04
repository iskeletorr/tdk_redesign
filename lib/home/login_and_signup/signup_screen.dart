import 'package:flutter/material.dart';
import 'package:practice_1/auth/auth_service.dart';
import 'package:practice_1/components/login_signup/rounded_button.dart';
import '../../components/login_signup/camera.dart';
import '../../components/login_signup/common_image.dart';
import '../../components/login_signup/page_title.dart';
import '../../components/login_signup/password_field.dart';
import '../../components/login_signup/standard_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  // TextEditingController controller4 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    controller3.dispose();
    // controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CommonImage(),
              const PageTitle('Sign-up'),
              // const SizedBox(
              //   height: 100,
              //   child: CameraAccess(),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                  

                    StandardField(controller: emailController, hintText: 'Your email id', field: 'Email'), // name
                    const SizedBox(height: 20),
                    StandardField(controller: passwordController, hintText: 'Your password', field: 'Password'), // email
                    // const SizedBox(height: 10),
                    // StandardField(controller: controller3, hintText: 'Your contact number', field: 'Contact'),
                    const SizedBox(height: 10),
                    // const PasswordField(),
                    RoundedButton(
                      title: 'Signup',
                      press: () {
                        authService.register(emailController.text, passwordController.text);
                        print("user registered");
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
