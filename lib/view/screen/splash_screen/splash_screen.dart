
import 'package:flutter/material.dart';

import '../onboarding_screen/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> nextPage()async {
    await Future.delayed(const Duration(seconds: 3)).then(
          (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  OnBoardingScreen()),
      ),
    );
  }
  @override
  void initState() {
    nextPage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Center(child: Image.asset("assets/icon/app_icon.png",width: 217,height: 66,fit: BoxFit.cover,)) ,
      ),
    );
  }
}
