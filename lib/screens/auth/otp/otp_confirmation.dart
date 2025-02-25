// ignore_for_file: cast_from_null_always_fails, unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/widgets/back_widget.dart';

// ignore: must_be_immutable
class OtpConfirmation extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  final String emailAddress;
  final Future<String> Function(String) validateOtp;
  final void Function(BuildContext) routeCallback;
  late Color topColor;
  late Color bottomColor;
  late bool _isGradientApplied;
  final Color titleColor;
  final Color themeColor;
  final Color keyboardBackgroundColor;
  final Widget icon;

  /// default [otpLength] is 4
  final int otpLength;

  OtpConfirmation({
    Key? key,
    this.title = "Verification Code",
    this.subTitle = "please enter the OTP sent to your\n device",
    this.otpLength = 4,
    required this.validateOtp,
    required this.routeCallback,
    this.themeColor = Colors.black,
    this.titleColor = Colors.black,
    required this.icon,
    required this.keyboardBackgroundColor, required this.image, required this.emailAddress,
  }) : super(key: key) {
    this._isGradientApplied = false;
  }

  OtpConfirmation.withGradientBackground(
      {Key? key,
        this.title = "Verification Code",
        this.subTitle = "please enter the OTP sent to your\n device",
        this.otpLength = 4,
        required this.validateOtp,
       required this.routeCallback,
        this.themeColor = Colors.white,
        this.titleColor = Colors.white,
        required this.topColor,
        required this.bottomColor,
        required this.keyboardBackgroundColor,
        required this.icon, required this.image, required this.emailAddress})
      : super(key: key) {
    this._isGradientApplied = true;
  }

  @override
  _OtpConfirmationState createState() => new _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation>
    with SingleTickerProviderStateMixin {
  late Size _screenSize;
  late int _currentDigit;
  late List<int> otpValues;
  bool showLoadingButton = false;

  @override
  void initState() {
    otpValues = List<int>.filled(widget.otpLength, 0,growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: new Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: widget._isGradientApplied
              ? BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.topColor, widget.bottomColor],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0, 1],
                tileMode: TileMode.clamp,
              ))
              : BoxDecoration(),
          width: _screenSize.width,
          child: _getInputPart,
        ),
      ),
    );
  }
  /// Return "OTP" input fields
  get _getInputField {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getOtpTextWidgetList(),
    );
  }

  /// Returns otp fields of length [widget.otpLength]
  List<Widget> getOtpTextWidgetList() {
    // ignore: deprecated_member_use
    List<Widget> optList = [];
    for (int i = 0; i < widget.otpLength; i++) {
      optList.add(_otpTextField(otpValues[i]));
    }
    return optList;
  }

  /// Returns Otp screen views
  get _getInputPart {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackWidget(name: Strings.verification,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _getInputField,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.didntGetOtpCode,
              style: CustomStyle.textStyle,
            ),
            Text(
              Strings.resend.toUpperCase(),
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${Strings.demoVerificationCode}: ',
              style: CustomStyle.textStyle,
            ),
            Text(
              '1234',
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        showLoadingButton
            ? Center(child: CircularProgressIndicator())
            : Container(
          width: 0,
          height: 0,
        ),
        _getOtpKeyboard
      ],
    );
  }

  /// Returns "Otp" keyboard
  get _getOtpKeyboard {
    return new Container(
        color: widget.keyboardBackgroundColor,
        height: _screenSize.width - 100,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _otpKeyboardInputButton(
                      label: "1",
                      onPressed: () {
                        _setCurrentDigit(1);
                      }),
                  _otpKeyboardInputButton(
                      label: "2",
                      onPressed: () {
                        _setCurrentDigit(2);
                      }),
                  _otpKeyboardInputButton(
                      label: "3",
                      onPressed: () {
                        _setCurrentDigit(3);
                      }),
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "4",
                    onPressed: () {
                      _setCurrentDigit(4);
                    }),
                _otpKeyboardInputButton(
                    label: "5",
                    onPressed: () {
                      _setCurrentDigit(5);
                    }),
                _otpKeyboardInputButton(
                    label: "6",
                    onPressed: () {
                      _setCurrentDigit(6);
                    }),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "7",
                    onPressed: () {
                      _setCurrentDigit(7);
                    }),
                _otpKeyboardInputButton(
                    label: "8",
                    onPressed: () {
                      _setCurrentDigit(8);
                    }),
                _otpKeyboardInputButton(
                    label: "9",
                    onPressed: () {
                      _setCurrentDigit(9);
                    }),
              ],
            ),
            Flexible(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                    width: 80.0,
                  ),
                  _otpKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  _otpKeyboardActionButton(
                      label: new Icon(
                        Icons.backspace,
                        color: widget.themeColor,
                      ),
                      onPressed: () {
                        setState(() {
                          for (int i = widget.otpLength - 1; i >= 0; ) {
                            otpValues[i] = null as int;
                            break;
                          }
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Returns "Otp text field"
  Widget _otpTextField(int digit) {
    return new Container(
      width: 50.0,
      height: 50.0,
      alignment: Alignment.center,
      child: new Text(
        digit != null ? digit.toString() : "",
        style: new TextStyle(
          fontSize: 30.0,
          color: widget.titleColor,
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: widget.titleColor,
          ),
        borderRadius: BorderRadius.circular(25)
      ),
    );
  }

  /// Returns "Otp keyboard input Button"
  Widget _otpKeyboardInputButton({required String label, VoidCallback? onPressed}) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: onPressed,
        borderRadius: new BorderRadius.circular(40.0),
        child: new Container(
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: new Center(
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 30.0,
                color: widget.themeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns "Otp keyboard action Button"
  _otpKeyboardActionButton({required Widget label, VoidCallback? onPressed}) {
    return new InkWell(
      onTap: onPressed,
      borderRadius: new BorderRadius.circular(40.0),
      child: new Container(
        height: 80.0,
        width: 80.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Center(
          child: label,
        ),
      ),
    );
  }

  /// sets number into text fields n performs
  ///  validation after last number is entered
  void _setCurrentDigit(int i) async {
    setState(() {
      _currentDigit = i;
      int currentField;
      for (currentField = 0; currentField < widget.otpLength; currentField++) {
        if (otpValues[currentField] == null) {
          otpValues[currentField] = _currentDigit;
          break;
        }
      }
      if (currentField == widget.otpLength - 1) {
        showLoadingButton = true;
        String otp = otpValues.join();
        widget.validateOtp(otp).then((value) {
          showLoadingButton = false;
          if (value == null) {
            widget.routeCallback(context);
          } else if (value.isNotEmpty) {
            showToast(context, value);
            clearOtp();
          }
        });
      }
    });
  }

  ///to clear otp when error occurs
  void clearOtp() {
    otpValues = List<int>.filled(widget.otpLength, null as int, growable: false);
    setState(() {});
  }

  ///to show error  message
  showToast(BuildContext context, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}
