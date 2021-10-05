import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _toggleVisibility = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.secondaryColor,
        body: Stack(
          children: [
            BackWidget(name: Strings.changePassword,),
            bodyWidget(context)
          ],
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.defaultPaddingSize, right: Dimensions.defaultPaddingSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: oldPasswordController,
                    validator: (String value){
                      if(value.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.oldPassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintStyle: CustomStyle.textStyle,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: _toggleVisibility
                            ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: _toggleVisibility,
                  ),
                  SizedBox(height: Dimensions.heightSize),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: newPasswordController,
                    validator: (String value){
                      if(value.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.newPassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintStyle: CustomStyle.textStyle,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: _toggleVisibility
                            ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: _toggleVisibility,
                  ),
                  SizedBox(height: Dimensions.heightSize),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: confirmPasswordController,
                    validator: (String value){
                      if(value.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.rePassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.transparent,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: _toggleVisibility
                            ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                      hintStyle: CustomStyle.textStyle,
                    ),
                    obscureText: _toggleVisibility,
                  ),
                  SizedBox(height: Dimensions.heightSize),
                ],
              )
          ),
          SizedBox(height: Dimensions.heightSize),
          GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
              ),
              child: Center(
                child: Text(
                  Strings.apply.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize
                  ),
                ),
              ),
            ),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }

}
