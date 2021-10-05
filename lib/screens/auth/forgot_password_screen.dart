import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackWidget(name: Strings.forgotPassword,),
            bodyWidget(context)
          ],
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.defaultPaddingSize,
          right: Dimensions.defaultPaddingSize,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputFieldWidget(context),
          resetButtonWidget(context),
        ],
      ),
    );
  }

  inputFieldWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              style: CustomStyle.textStyle,
              controller: emailController,
              keyboardType: TextInputType.name,
              validator: (String value){
                if(value.isEmpty){
                  return Strings.pleaseFillOutTheField;
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: Strings.email,
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
                  Icons.email,
                  color: CustomColor.primaryColor,
                )
              ),
            ),
            SizedBox(height: Dimensions.heightSize,),
          ],
        )
    );
  }

  resetButtonWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: Dimensions.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: CustomColor.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
        ),
        child: Center(
          child: Text(
            Strings.resetPassword.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.largeTextSize
            ),
          ),
        ),
      ),
      onTap: () {

      },
    );
  }
}
