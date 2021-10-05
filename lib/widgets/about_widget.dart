import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
      ),
      child: Text(Strings.demoAbout),
    );
  }
}
