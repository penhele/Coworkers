import 'package:coworkers/widgets/input_auth.dart';
import 'package:coworkers/widgets/input_auth_password.dart';
import 'package:coworkers/widgets/secondary_button.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/signin_background.png',
                  fit: BoxFit.fitWidth,
                ),
                Center(
                  child: Image.asset(
                    'assets/applogo.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Positioned (
                  bottom: 0,
                  left: 20  ,
                  child: Transform.translate(
                    offset: Offset(0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'New Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.black
                          ),
                        ),
                        DView.height(8),
                        const Text(
                          "Let's grow your business today"
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          DView.height(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InputAuth(
                  editingController: TextEditingController(),
                  title: 'Complete Name',
                  hint: 'Write your name',
                ),
                DView.height(),
                InputAuth(
                  editingController: TextEditingController(),
                  title: 'Email Address',
                  hint: 'Write your email',
                ),
                DView.height(),
                InputAuthPassword(
                  editingController: TextEditingController(),
                  title: 'Password',
                  hint: 'Write your password',
                ),
                DView.height(30),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Material(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    DView.width(8),
                    const Text(
                      'I agree with terms and conditions',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                DView.height(30),
                FilledButton(onPressed: () {}, child: const Text('Sign Up')),
                DView.height(),
                SecondaryButton(
                  onPressed: () {},
                  child: const Text('Sign In to My Account'),)
              ],
            ),
          ),
          DView.height(30),
        ],
      ),
    );
  }
}