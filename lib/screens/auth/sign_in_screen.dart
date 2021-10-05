import 'package:bizcart/screens/auth/forgot_password_screen.dart';
import 'package:flutter/material.dart';

import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:bizcart/screens/auth/sign_up_screen.dart';

import '../dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackWidget(name: Strings.signInAccount,),
              bodyWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        inputFieldWidget(context),
        SizedBox(height: Dimensions.heightSize * 2),
        signInButtonWidget(context),
        SizedBox(height: Dimensions.heightSize),
        forgotPasswordWidget(context),
        SizedBox(height: Dimensions.heightSize * 2),
        orLoginWidget(context),
        SizedBox(height: Dimensions.heightSize * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.ifYouHaveNoAccount,
              style: CustomStyle.textStyle,
            ),
            GestureDetector(
              child: Text(
                Strings.createAccount.toUpperCase(),
                style: TextStyle(
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  SignUpScreen()));
              },
            )
          ],
        )
      ],
    );
  }

  inputFieldWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: Strings.demoEmail,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelStyle: CustomStyle.textStyle,
                    filled: true,
                    fillColor: Colors.transparent,
                    hintStyle: CustomStyle.textStyle,
                    focusedBorder: CustomStyle.focusBorder,
                    enabledBorder: CustomStyle.focusErrorBorder,
                    focusedErrorBorder: CustomStyle.focusErrorBorder,
                    errorBorder: CustomStyle.focusErrorBorder,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: CustomColor.primaryColor,
                    )
                ),
              ),
              SizedBox(height: Dimensions.heightSize,),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: CustomColor.primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                      Icons.visibility_off,
                      color: CustomColor.primaryColor,
                    )
                        : Icon(
                      Icons.visibility,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                ),
                obscureText: _toggleVisibility,
              ),
              SizedBox(height: Dimensions.heightSize),
            ],
          ),
        )
    );
  }

  signInButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
          ),
          child: Center(
            child: Text(
              Strings.signIn.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  DashboardScreen()));
        },
      ),
    );
  }

  forgotPasswordWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: Dimensions.marginSize
      ),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            Strings.forgotPassword,
            textAlign: TextAlign.end,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen
            ()));
        },
      ),
    );
  }

  orLoginWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.orLoginWith,
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.largeTextSize,
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(Dimensions.radius * 3),
              child: Container(
                height: Dimensions.buttonHeight,
                width: Dimensions.buttonHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius * 3)
                ),
                child: Image.asset(
                    'assets/images/google.png'
                ),
              ),
            ),
            SizedBox(width: Dimensions.widthSize,),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(Dimensions.radius * 3),
              child: Container(
                height: Dimensions.buttonHeight,
                width: Dimensions.buttonHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius * 3)
                ),
                child: Image.asset(
                    'assets/images/facebook.png'
                ),
              ),
            ),
            SizedBox(width: Dimensions.widthSize,),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(Dimensions.radius * 3),
              child: Container(
                height: Dimensions.buttonHeight,
                width: Dimensions.buttonHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius * 3)
                ),
                child: Image.asset(
                    'assets/images/twitter.png'
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
