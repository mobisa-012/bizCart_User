import 'package:bizcart/screens/confirm_order_screen.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final nameController = TextEditingController();
  final expDateController = TextEditingController();
  final cvvController = TextEditingController();

  bool status = false;

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
              BackWidget(name: Strings.payment,),
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
            cardFormWidget(context),
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

  cardFormWidget(BuildContext context) {
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
          top: Dimensions.heightSize,
        ),
        child: Column(
          children: [
            cardWidget(context),
            formWidget(context),
            SizedBox(height: Dimensions.heightSize,),
            saveCardInformation(context)
          ],
        ),
      ),
    );
  }

  cardWidget(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: Dimensions.heightSize
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.marginSize
            ),
            child: cardData(
                'assets/images/card/visa.png',
              'Visa'
            ),
          ),
          SizedBox(width: Dimensions.widthSize,),
          cardData(
              'assets/images/card/mastercard.png',
            'Master Card'
          ),
          SizedBox(width: Dimensions.widthSize,),
          Padding(
            padding: EdgeInsets.only(
                right: Dimensions.marginSize
            ),
            child: cardData(
                'assets/images/card/paypal.png',
              'Paypal'
            ),
          ),
        ],
      ),
    );
  }

  formWidget(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimensions.heightSize,
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                Strings.cardNumber
            ),
            TextFormField(
              style: CustomStyle.textStyle,
              controller: numberController,
              keyboardType: TextInputType.number,
              validator: (String value){
                if(value.isEmpty){
                  return Strings.pleaseFillOutTheField;
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: Strings.demoCardNumber,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelStyle: CustomStyle.textStyle,
                filled: true,
                fillColor: Colors.transparent,
                hintStyle: CustomStyle.textStyle,
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 2,),
            Text(
                Strings.cardHolderName
            ),
            TextFormField(
              style: CustomStyle.textStyle,
              controller: nameController,
              keyboardType: TextInputType.name,
              validator: (String value){
                if(value.isEmpty){
                  return Strings.pleaseFillOutTheField;
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: Strings.demoName,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelStyle: CustomStyle.textStyle,
                filled: true,
                fillColor: Colors.transparent,
                hintStyle: CustomStyle.textStyle,
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 2,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          Strings.expirationDate
                      ),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: expDateController,
                        keyboardType: TextInputType.number,
                        validator: (String value){
                          if(value.isEmpty){
                            return Strings.pleaseFillOutTheField;
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: '02/30',
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          filled: true,
                          fillColor: Colors.transparent,
                          hintStyle: CustomStyle.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Dimensions.widthSize,),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          Strings.cvv
                      ),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        validator: (String value){
                          if(value.isEmpty){
                            return Strings.pleaseFillOutTheField;
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: '123',
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          filled: true,
                          fillColor: Colors.transparent,
                          hintStyle: CustomStyle.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  saveCardInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Strings.saveCreditCardInformation,
            style: TextStyle(
              color: Colors.black
            ),
          ),
          SizedBox(
            height: 30,
            width: 70,
            child: CustomSwitch(
              activeColor: CustomColor.primaryColor,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),
          ),
        ],
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
              Strings.payNow,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmOrderScreen()));
        },
      ),
    );
  }

  cardData(String image, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius),
            boxShadow: [
              BoxShadow(
                color: CustomColor.greyColor.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.marginSize),
            child: Image.asset(image),
          ),
        ),
        Text(
          name,
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.defaultTextSize,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

}
