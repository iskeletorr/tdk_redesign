import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../auth/auth_service.dart';
import '../../components/login_signup/common_image.dart';
import '../../components/login_signup/page_title.dart';
import '../../components/login_signup/rounded_button.dart';
import '../../components/login_signup/standard_field.dart';
import '../../navigation/app_router.dart';
import '../../util/connectivity_x.dart';
import '../../util/user_preferences.dart';
import 'forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  bool isNotInitial() {
    var box = UserPreferences.instance.getSkip();
    bool isInitial = box == null ? false : true;
    return isInitial;
  }

  @override
  void initState() {
    super.initState();
    NetworkAwareState(context).initStateSubs();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(children: [
              const CommonImage(),
              const PageTitle('Log-in'),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  children: [
                    StandardField(controller: emailController, hintText: 'Your email id', field: 'Email'),
                    const SizedBox(height: 20),
                    StandardField(controller: passwordController, hintText: 'Your password', field: 'Password'),
                    const SizedBox(height: 20),
                    // const PasswordField(), // suffix
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ForgotScreen(),
                              ),
                            );
                          },
                          child: const Text('Forget password?', style: TextStyle(color: Color.fromARGB(200, 107, 103, 103))))
                    ]),
                  ],
                ),
              ),
              RoundedButton(
                title: 'Login',
                press: () {
                  if (formKey.currentState!.validate()) {
                    authService.signIn(emailController.text, passwordController.text).then((e) {
                      if (isNotInitial()) {
                        AutoRouter.of(context).replace(const DashboardRoute());
                      } else {
                        AutoRouter.of(context).replace(const OnboardRoute());
                      }
                    }, onError: (e) {
                      print("Error : ${e.toString()}");
                      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error : ${e.toString()}')));
                    });
                  }
                },
              ),
              signupButton(),
              Row(
                children: const [
                  Expanded(
                      child: Divider(
                    color: Colors.black45,
                  )),
                  Text('Or login with'),
                  Expanded(child: Divider()),
                ],
              ),
              bottomButtons()
            ]),
          ),
        ),
      ),
    );
  }

  Row signupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account ? '),
        TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: AlignmentDirectional.centerStart),
            onPressed: () {
              context.router.push(const SignupRoute());
            },
            child: const Text('Sign-up', style: TextStyle(color: Color(0xFF69787f), fontWeight: FontWeight.w700)))
      ],
    );
  }

  Row bottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/gmail.png'),
          style: ButtonStyle(elevation: MaterialStateProperty.all(15)),
        ),
        const SizedBox(
          width: 15,
        ),
        // IconButton(onPressed: () {}, icon: Image.asset('assets/facebook-new.png')),
        // Inkwell() or GestureDetector()
        InkWell(
          onTap: () {},
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/facebook-new.png',
                width: 32,
                height: 32,
              ),
            ),
          ),
        )
      ],
    );
  }
}
