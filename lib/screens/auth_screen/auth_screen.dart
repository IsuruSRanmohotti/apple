import 'package:apple/providers/auth_provider.dart';
import 'package:apple/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String type = 'signup';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<UserAuthProvider>(
          builder: (context, userAuthProvider, child) {
        return Column(
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
                          Text(
                            type == 'signup'
                                ? 'Create Your Account'
                                : type == 'signin'
                                    ? 'Signin With Your Account'
                                    : 'Forgot Your Password?',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            type == 'signup'
                                ? 'Create Your User Account With Apple'
                                : type == 'signin'
                                    ? 'Connect with your user account'
                                    : 'Please Enter your email address',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade300),
                          )
                        ],
                      ),
                    ),
                    BackButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (type == 'signup') {
                          } else if (type == 'signin') {
                            type = 'signup';
                          } else {
                            type = 'signin';
                          }
                        });
                      },
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
                  type == 'signup'
                      ? CustomTextField(
                          controller: userAuthProvider.userNameController,
                          hint: 'User Name',
                          prefixIcon: Icons.person,
                        )
                      : const SizedBox(),
                  CustomTextField(
                    controller: userAuthProvider.emailController,
                    hint: 'Email',
                    prefixIcon: Icons.email_rounded,
                  ),
                  type == 'forgot'
                      ? const SizedBox()
                      : CustomTextField(
                          controller: userAuthProvider.passwordController,
                          hint: 'Password',
                          prefixIcon: Icons.password_rounded,
                          isPassword: true,
                        ),
                  type == 'signup'
                      ? CustomTextField(
                          controller:
                              userAuthProvider.confirmPasswordController,
                          hint: 'Confirm Password',
                          prefixIcon: Icons.password_rounded,
                          isPassword: true,
                        )
                      : const SizedBox(),
                  type == 'signin'
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                type = 'forgot';
                              });
                            },
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                  color: CustomColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    size: size,
                    text: type == 'signup'
                        ? 'Create Account'
                        : type == 'signin'
                            ? 'Sign In'
                            : 'Send Password Reset Email',
                    onTap: () {
                      if (type == 'signup') {
                        userAuthProvider.startCreateAccount(context);
                      } else if (type == 'signin') {
                        userAuthProvider.startSignInUser(context);
                      } else {
                        userAuthProvider.startSendPasswordResetEmail(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  type == 'forgot'
                      ? const SizedBox()
                      : Text(type == 'signup'
                          ? "Already you have an account?"
                          : 'You Don\'t Have An Account'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    size: size,
                    text: type == 'signup'
                        ? 'Sign In'
                        : type == 'signin'
                            ? 'Create Account'
                            : 'Sign In',
                    bgColor: Colors.white,
                    fontColor: CustomColors.primaryColor,
                    onTap: () {
                      setState(() {
                        type = type == 'signup'
                            ? 'signin'
                            : type == 'signin'
                                ? 'signup'
                                : 'signin';
                      });
                    },
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
