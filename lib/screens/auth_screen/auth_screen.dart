import 'package:flutter/material.dart';

import '../../components/custom_text_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/auth_bg.png'))),
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Image.asset(
                            'assets/images/apple_logo.png',
                            color: Colors.white,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const Text(
                          'Create Your Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Create Your User Account With Apple',
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade300),
                        )
                      ],
                    ),
                  ),
                  const BackButton(
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const CustomTextField(
                  hint: 'User Name',
                  prefixIcon: Icons.person,
                ),
                const CustomTextField(
                  hint: 'Email',
                  prefixIcon: Icons.email_rounded,
                ),
                const CustomTextField(
                  hint: 'Password',
                  prefixIcon: Icons.password_rounded,
                  isPassword: true,
                ),
                const CustomTextField(
                  hint: 'Confirm Password',
                  prefixIcon: Icons.password_rounded,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      color: const Color(0xFF1A2285),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                      child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Already you have an account?"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: const Color(0xFF1A2285), width: 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                      child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Color(0xFF1A2285),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
