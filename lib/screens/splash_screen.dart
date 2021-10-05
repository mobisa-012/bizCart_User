import 'dart:async';

import 'package:bizcart/utils/colors.dart';
import 'package:flutter/material.dart';

import 'onboard/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.amber];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColor.primaryColor,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splash_logo.png',
            fit: BoxFit.contain,
            height: 120,
            width: 120,
          ),
        ),
      ),
    );
  }
}
