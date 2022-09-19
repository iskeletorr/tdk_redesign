import 'package:flutter/material.dart';

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
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  // TextEditingController controller4 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    controller2.dispose();
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
              const SizedBox(
                height: 100,
                child: CameraAccess(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(
                  children: [
                    StandardField(controller: controller, hintText: 'Your name', field: 'Name'),
                    const SizedBox(height: 10),
                    StandardField(controller: controller2, hintText: 'Your email id', field: 'Email'),
                    const SizedBox(height: 10),
                    StandardField(controller: controller3, hintText: 'Your contact number', field: 'Contact'),
                    const SizedBox(height: 10),
                    const PasswordField(),
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
