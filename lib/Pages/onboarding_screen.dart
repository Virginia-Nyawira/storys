import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';
import 'package:storys/Pages/homescreen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/blog.png",
      title: "Read",
      desc:"Discover restaurants by type of meal, See menus and photos for nearby restaurants and bookmark your favorite places on the go",
    ),
    OnbordingData(
      imagePath: "assets/blogg.png",
      title: "Learn",
      desc:"Best restaurants delivering to your doorstep, Browse menus and build your order in seconds",
    ),
    OnbordingData(
      imagePath: "assets/four.png",
      title: "Be Inspired",
      desc:"Explore curated lists of top restaurants, cafes, pubs, and bars in Mumbai, based on trends.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroScreen(
        list,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
    );
  }
}
