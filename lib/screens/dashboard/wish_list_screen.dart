import 'package:bizcart/data/cart.dart';
import 'package:flutter/material.dart';

import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/widgets/header_widget.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

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
              HeaderWidget(name: Strings.wishList,),
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
          itemCount: CartList.list().length,
          itemBuilder: (context, index) {
            Cart cart = CartList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.heightSize
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.greyColor.withOpacity(0.3),
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
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Image.asset(
                            cart.image,
                            fit: BoxFit.cover,
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
                              cart.name,
                              style: TextStyle(
                                  fontSize: Dimensions.largeTextSize,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: Dimensions.heightSize,),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 7,
                                  color: Colors.black,
                                ),
                                SizedBox(width: Dimensions.widthSize * 0.5,),
                                Text(
                                  Strings.color,
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                                SizedBox(width: Dimensions.widthSize * 0.5,),
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(7.5)
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: Dimensions.heightSize * 0.5,),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 7,
                                  color: Colors.black,
                                ),
                                SizedBox(width: Dimensions.widthSize * 0.5,),
                                Text(
                                  '${Strings.brand}: ',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(width: Dimensions.widthSize * 0.5,),
                                Text(
                                  'Gucci',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.heightSize * 0.5,),
                            Text(
                              '\$${cart.newPrice}',
                              style: TextStyle(
                                  fontSize: Dimensions.defaultTextSize,
                                  color: CustomColor.primaryColor
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              icon: Icon(
                                  Icons.delete,
                                size: 20,
                              ),
                              onPressed: null
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
