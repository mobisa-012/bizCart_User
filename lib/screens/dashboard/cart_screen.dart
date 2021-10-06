import 'package:bizcart/data/cart.dart';
import 'package:bizcart/screens/address_screen.dart';
import 'package:flutter/material.dart';

import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/widgets/header_widget.dart';
import 'package:bizcart/widgets/add_quantity_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

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
              HeaderWidget(name: Strings.myShoppingCart,),
              bodyWidget(context),
              checkOutWidget(context),

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            icon: Icon(
                              Icons.delete
                            ),
                            onPressed: null
                        ),
                      ),
                      Expanded(
                        flex: 4,
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
                          ],
                        ),
                      ),
                      SizedBox(width: Dimensions.widthSize,),
                      Expanded(
                          flex: 2,
                          child: AddQuantityWidget())
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

  checkOutWidget(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColor.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2),
            topRight: Radius.circular(Dimensions.radius * 2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'USD 276.00',
                      style: TextStyle(
                          color: CustomColor.primaryColor,
                          fontSize: Dimensions.largeTextSize,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      Strings.total,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.largeTextSize
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: CustomColor.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(Dimensions.radius * 2)
                    ),
                    child: Center(
                      child: Text(
                        Strings.checkOut.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        AddressScreen()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
