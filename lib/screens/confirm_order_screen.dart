import 'package:bizcart/data/cart.dart';
import 'package:bizcart/screens/dashboard_screen.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';

class ConfirmOrderScreen extends StatefulWidget {

  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {

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
              BackWidget(name: Strings.confirmOrder,),
              bodyWidget(context),
              buttonWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            statusWidget(context),
            SizedBox(height: Dimensions.heightSize * 4,),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius * 2),
                  topRight: Radius.circular(Dimensions.radius * 2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.primaryColor.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: Dimensions.heightSize,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cartWidget(context),
                    SizedBox(height: Dimensions.heightSize,),
                    deliveryWidget(context),
                    SizedBox(height: Dimensions.heightSize,),
                    paymentWidget(context),
                    SizedBox(height: Dimensions.heightSize,),
                    totalAmountWidget(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  statusWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.heightSize * 2,
            left: Dimensions.marginSize * 2,
            right: Dimensions.marginSize * 2,
          ),
          child: Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 3,
                  color: CustomColor.primaryColor,
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 3,
                  color: CustomColor.primaryColor,
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 3,
                  color: CustomColor.primaryColor,
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  Strings.address,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Strings.delivery,
                  style: TextStyle(
                      color: Colors.black
                  ),
                    textAlign: TextAlign.center
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Strings.payment,
                  style: TextStyle(
                      color: Colors.black
                  ),
                    textAlign: TextAlign.center
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Strings.confirm,
                  style: TextStyle(
                      color: Colors.black
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  cartWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.inYourCart,
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: CartList.list().length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  deliveryWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.delivery,
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.withOpacity(0.6)
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Express - \$8.99',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.largeTextSize,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5,),
                  Text(
                    'Next Day Delivery',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: Dimensions.defaultTextSize,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  paymentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.payment,
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.withOpacity(0.6)
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.demoCardNumber,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: Dimensions.defaultTextSize,
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5,),
                  Image.asset(
                    'assets/images/card/mastercard.png',
                    height: 20,
                    width: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  totalAmountWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize
      ),
      child: Text(
        '${Strings.total}: \$183',
        style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.largeTextSize,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          decoration: BoxDecoration(
              color: CustomColor.primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius)
          ),
          child: Center(
            child: Text(
              Strings.orderNow,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          openOrderSuccessDialog(context);
        },
      ),
    );
  }

  openOrderSuccessDialog(BuildContext context){
    showGeneralDialog(
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.white.withOpacity(0.6),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 12, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/tik.png'),
                      SizedBox(height: Dimensions.heightSize,),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize,
                        ),
                        child: Text(
                          Strings.youHaveSuccessfullyPlaced,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize * 2,),
                      GestureDetector(
                        child: Container(
                          height: Dimensions.buttonHeight,
                          width: 150,
                          decoration: BoxDecoration(
                              color: CustomColor.accentColor,
                              borderRadius: BorderRadius.circular(Dimensions.radius)
                          ),
                          child: Center(
                            child: Text(
                              Strings.backToHome.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                              DashboardScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
            Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        });
  }
}
