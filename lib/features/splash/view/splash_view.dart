import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/features/onBoarding/view/onBoarding1_view.dart';

class SplashScreen_view extends StatefulWidget {
  const SplashScreen_view({super.key});

  @override
  _SplashScreen_viewState createState() => _SplashScreen_viewState();
}

class _SplashScreen_viewState extends State<SplashScreen_view> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding1_View()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.splash1, width: 274, height: 100),
      ),
    );
  }
}
