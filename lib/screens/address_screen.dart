import 'package:bizcart/screens/delivery_screen.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final stateController = TextEditingController();
  final phoneController = TextEditingController();

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
              BackWidget(name: Strings.address,),
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
            formWidget(context),
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

  formWidget(BuildContext context) {
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
      child: Form(
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
                Strings.name
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value){
                  if(value!.isEmpty){
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
              Text(
                  Strings.email
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoEmail,
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
                            Strings.city
                        ),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: cityController,
                          keyboardType: TextInputType.text,
                          validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                          decoration: InputDecoration(
                            hintText: Strings.demoCity,
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
                            Strings.zipCode
                        ),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: zipController,
                          keyboardType: TextInputType.number,
                          validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                          decoration: InputDecoration(
                            hintText: Strings.demoZipCode,
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
              SizedBox(height: Dimensions.heightSize * 2,),
              Text(
                  Strings.state
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: stateController,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoState,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                ),
              ),
              SizedBox(height: Dimensions.heightSize * 2,),
              Text(
                  Strings.phoneNumber
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: phoneController,
                keyboardType: TextInputType.number,
               validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoNumber,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: CustomStyle.textStyle,
                ),
              ),
              SizedBox(height: Dimensions.heightSize * 2,),
            ],
          ),
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveryScreen()));
        },
      ),
    );
  }
}
