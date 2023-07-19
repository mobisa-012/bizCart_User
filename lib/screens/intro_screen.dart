import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:flutter/material.dart';

import 'auth/sign_in_screen.dart';
import 'auth/sign_up_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 2, right: Dimensions.marginSize * 2),
              child: Text(
                Strings.startByCreatingAccount,
                style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize * 1.5,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Dimensions.heightSize),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 2, right: Dimensions.marginSize * 2),
              child: Text(
                Strings.introSubTitle,
                style: TextStyle(
                  fontSize: Dimensions.largeTextSize,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize * 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 2, right: Dimensions.marginSize * 2),
              child: GestureDetector(
                child: Container(
                  height: Dimensions.buttonHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.primaryColor, borderRadius: BorderRadius.circular(Dimensions.radius)),
                  child: Center(
                    child: Text(
                      Strings.createAnAccount.toUpperCase(),
                      style: TextStyle(
                        fontSize: Dimensions.largeTextSize,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 2, right: Dimensions.marginSize * 2),
              child: GestureDetector(
                child: Container(
                  height: Dimensions.buttonHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor, borderRadius: BorderRadius.circular(Dimensions.radius)),
                  child: Center(
                    child: Text(
                      Strings.signIn.toUpperCase(),
                      style: TextStyle(
                        fontSize: Dimensions.largeTextSize,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
