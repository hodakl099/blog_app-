import 'package:blog_app/features/widgets/auth_field.dart';
import 'package:blog_app/features/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign up.',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const AuthField(
              hintText: 'Name',
            ),
            const SizedBox(
              height: 16,
            ),
            const AuthField(
              hintText: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            const AuthField(
              hintText: 'Passowrd',
            ),
            const SizedBox(
              height: 16,
            ),
            AuthGradientButton(
              buttonText: 'Sign up',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
