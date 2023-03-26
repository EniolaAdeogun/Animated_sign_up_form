import 'package:flutter/material.dart';
import 'components/animated_hover.dart';
import 'sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedHover(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Get Started',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 40),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
