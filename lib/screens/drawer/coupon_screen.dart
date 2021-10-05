import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';

import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
class CouponScreen extends StatefulWidget {
  @override
  _CouponScreenState createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.secondaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackWidget(name: Strings.coupons,),
              bodyWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 80
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.heightSize,
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.greyColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                   left: -15,
                   right: -15,
                   top: 0,
                   bottom: 0,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Container(
                         height: 30,
                         width: 30,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15)
                         ),
                       ),
                       Text(
                           '- - - - - - - - - - - - - - - - - - - -',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: Dimensions.extraLargeTextSize
                         ),
                       ),
                       Container(
                         height: 30,
                         width: 30,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15)
                         ),
                       ),
                     ],
                   ),
                  ),
                  Positioned(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                    top: Dimensions.heightSize,
                    bottom: Dimensions.heightSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10%',
                          style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize * 2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'Applies to first purchase Valid until 3rd September 2021',
                          style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
