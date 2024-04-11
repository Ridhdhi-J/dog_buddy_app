import 'dart:async';
import 'package:dog_buddy_dog/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  /// Splash screen Timer
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  OnBoardingScreen1())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// Container
        body: Container(
            padding: EdgeInsets.only(top: 50.h),
            width: 100.w,
            height: 100.h,
            decoration: const BoxDecoration(

                /// Background Image
                image: DecorationImage(
              image: AssetImage('asset/image/Splash.png'),
              fit: BoxFit.cover,
            )),

            /// Lottie Image

            child: Lottie.asset(
              /// GIF Image
              'asset/image/splash_gif.json',
            )));
  }
}
