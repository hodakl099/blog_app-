import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentataion/pages/signup_page.dart';
import 'package:blog_app/features/widgets/auth_field.dart';
import 'package:blog_app/features/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage()); 


  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();


    @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign in.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
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
                buttonText: 'Sign in',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.push(context, SigninPage.route()),
                child: RichText(
                    text: TextSpan(
                        text: 'Dont\'t have an accpunt?',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                          text: ' Sign up',
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
