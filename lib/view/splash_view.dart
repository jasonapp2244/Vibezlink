import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';
import 'package:getxmvvm/resources/routes/routes_name.dart';
import 'package:getxmvvm/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Timer(const Duration(seconds: 2), () {
      // Navigator.pushReplacementNamed(
      //   context,
      //   MaterialPageRoute(builder: (_) => Loginview()
      //   ),
      //   RoutesName.loginview
      // );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Loginview()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize responsive values
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth * 0.6; // 60% of screen width

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.8,
              colors: [
                Color.fromRGBO(22, 35, 54, 1),
                Color.fromRGBO(15, 6, 9, 1),
              ], // Your colors
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   "assets/icons/image-removebg-preview 1 (3).svg",
                //   fit: BoxFit.contain,
                // ),
                Image(image: AssetImage("assets/images/image-removebg-preview 1.png")),
                SizedBox(height: screenHeight * 0.02),

                // SvgPicture.asset(
                //   "assets/images/TORIINO.svg",
                //   fit: BoxFit.contain,
                // ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
