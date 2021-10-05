import 'package:bizcart/screens/payment_screen.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatefulWidget {

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {

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
              BackWidget(name: Strings.delivery,),
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
            deliveryTypeWidget(context)
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 3,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.grey,
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

  deliveryTypeWidget(BuildContext context) {
    return Container(
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
          top: Dimensions.heightSize * 4,
          left: Dimensions.marginSize * 2,
          right: Dimensions.marginSize * 2,
        ),
        child: Column(
          children: [
            typeData(
              'Free Delivery - \$0.0',
              '2 - 5 Days Delivery'
            ),
            SizedBox(height: Dimensions.heightSize,),
            typeData(
                'Standard - \$5.30',
                '1 - 3 Days Delivery'
            ),
            SizedBox(height: Dimensions.heightSize,),
            typeData(
                'Express - \$8.99',
                'Next Day Delivery'
            ),
            SizedBox(height: Dimensions.heightSize * 3,),
            Padding(
              padding: const EdgeInsets.all(Dimensions.marginSize),
              child: Text(
                'Free shipping over \$49 + free returns and exchange',
                style: TextStyle(
                    fontSize: Dimensions.defaultTextSize,
                    color: Colors.black.withOpacity(0.7)
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
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
              Strings.next,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen()));
        },
      ),
    );
  }

  typeData(String name, String value) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius * 2)
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
                name,
              style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            SizedBox(height: Dimensions.heightSize,),
            Text(
                value,
              style: TextStyle(
                fontSize: Dimensions.defaultTextSize,
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
