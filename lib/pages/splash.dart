// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_planets_app/pages/planet_list.dart';

// SPLASH SCREEN

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void enterHomePage(BuildContext ctx) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      ctx,
      MaterialPageRoute(builder: (context) => const PlanetListHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    enterHomePage(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo-02.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  color: Colors.tealAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
