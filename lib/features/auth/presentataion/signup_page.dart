import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/widgets/auth_field.dart';
import 'package:blog_app/features/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage()); 


  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign up.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                hintText: 'Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 16,
              ),
              AuthField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              AuthField(
                hintText: 'Passowrd',
                controller: passwordController,
              ),
                    const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign up',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.push(context, SignupPage.route()),
                child: RichText(
                    text: TextSpan(
                        text: 'Already have an account?',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                          text: ' Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
