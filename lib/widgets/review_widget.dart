import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/widgets/my_rating.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyRating(rating: '4',),
                SizedBox(height: Dimensions.heightSize * 0.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'by - SM Jhon',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: Dimensions.widthSize * 0.5,),
                        Text(
                          'Verified Purchased',
                          style: TextStyle(
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.extraSmallTextSize
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '21 Jan, 2021',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.extraSmallTextSize
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.heightSize * 0.5,),
                Text(
                  'But I must explain to you how all this mistaken idea of denouncing pleasure',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.extraSmallTextSize
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
