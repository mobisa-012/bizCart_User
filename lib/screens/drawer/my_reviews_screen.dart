import 'package:bizcart/data/review.dart';
import 'package:bizcart/screens/submit_review_screen.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';

import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';

class MyReviewsScreen extends StatefulWidget {
  @override
  _MyReviewsScreenState createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends State<MyReviewsScreen> {

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
              BackWidget(name: Strings.myReviews,),
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
          top: 80, bottom: 100,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: ReviewList.list().length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Review review = ReviewList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.heightSize
              ),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: Dimensions.heightSize,
                      bottom: Dimensions.heightSize,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: CustomColor.accentColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius)
                              ),
                              child: Image.asset(
                                review.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.widthSize,),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.name,
                                style: TextStyle(
                                    fontSize: Dimensions.largeTextSize,
                                    color: Colors.black
                                ),
                              ),
                              SizedBox(height: Dimensions.heightSize,),
                              Text(
                                'Purchased on ${review.date}',
                                style: TextStyle(
                                    fontSize: Dimensions.defaultTextSize,
                                    color: CustomColor.greyColor
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 25,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: CustomColor.primaryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12.5)
                              ),
                              child: Center(
                                child: Text(
                                  review.status,
                                  style: TextStyle(
                                    fontSize: Dimensions.extraSmallTextSize,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      SubmitReviewScreen()));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
