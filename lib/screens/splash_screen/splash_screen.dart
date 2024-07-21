import 'dart:async';
import 'package:apple/screens/auth_screen/auth_screen.dart';
import 'package:apple/screens/home/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Logger().f('User is currently signed out!');
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AuthScreen()));
         
        } else {
          Logger().f('User is signed in!');
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
        }
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/apple_logo.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Apple Store',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const CircularProgressIndicator.adaptive()
              ],
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'From Apple .Inc',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800),
                ))
          ],
        ),
      ),
    );
  }
}
