import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentataion/bloc/auth_bloc.dart';
import 'package:blog_app/features/widgets/auth_field.dart';
import 'package:blog_app/features/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());

  const SignupPage({super.key});

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
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
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
                isObscureText: false,
              ),
              const SizedBox(
                height: 16,
              ),
              AuthField(
                hintText: 'Email',
                controller: emailController,
                isObscureText: false,
              ),
              const SizedBox(
                height: 16,
              ),
              AuthField(
                hintText: 'Passowrd',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign up',
                onPressed: () {
                  debugPrint('test click sign up');

                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(AuthSignUp(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        passowrd: passwordController.text.trim()));
                  }
                },
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
