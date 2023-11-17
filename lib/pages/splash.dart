import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_dreams_tourism/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children: [
          SizedBox.expand(
            child: LottieBuilder.asset("lib/assets/images/air_plane.json"),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(140, 82, 255, 1),
      nextScreen: const LoginPage(),
      animationDuration: const Duration(seconds: 3),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.infinity, // Set the splash icon size to infinity to make it occupy the full screen
    );
  }
}
