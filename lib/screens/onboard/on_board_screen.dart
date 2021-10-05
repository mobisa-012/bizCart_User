import 'package:flutter/material.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
import '../intro_screen.dart';
import 'data.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: totalPages,
            itemBuilder: (context, index){
            OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.heightSize, bottom: Dimensions
                          .heightSize * 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            oi.image,
                          ),
                          SizedBox(height: Dimensions.heightSize * 3,),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.marginSize * 2.5,
                                right: Dimensions.marginSize * 2.5
                            ),
                            child: Column(
                              children: [
                                Text(
                                  oi.title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.extraLargeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: Dimensions.heightSize,),
                                Text(
                                  oi.subTitle,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.defaultTextSize,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Dimensions.heightSize * 3,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.center,
                              child: index != (totalPages - 1) ? Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Container(
                                  width: 100.0,
                                  height: 14.0,
                                  child: ListView.builder(
                                    itemCount: totalPages,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i){
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Container(
                                          width: index == i ? 14 : 14.0,
                                          decoration: BoxDecoration(
                                              color: index == i ? CustomColor.primaryColor :
                                              CustomColor.primaryColor.withOpacity(0.5),
                                              borderRadius: BorderRadius.all(Radius.circular(7.0))
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                                  : GestureDetector(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: CustomColor.primaryColor,
                                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius
                                            * 0.5))
                                    ),
                                    child: Center(
                                      child: Text(
                                        Strings.getStarted.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroScreen()));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    index != (totalPages - 1) ? skipButtonWidget(context) : Container()
                  ],
                )
              );
            }),
      ),
    );
  }

  skipButtonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius)
          ),
          child: Center(
            child: Text(
              Strings.skip,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroScreen()));
        },
      ),
    );
  }
}
