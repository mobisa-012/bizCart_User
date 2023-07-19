// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/screens/dashboard_screen.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class SubmitReviewScreen extends StatefulWidget {
  @override
  _SubmitReviewScreenState createState() => _SubmitReviewScreenState();
}

class _SubmitReviewScreenState extends State<SubmitReviewScreen> {

  TextEditingController commentController = TextEditingController();
  late File _image;
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
              BackWidget(name: Strings.submitReview,),
              SizedBox(height: Dimensions.heightSize * 2,),
              bodyWidget(context),
              submitButtonWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
          bottom: 100,
          left: Dimensions.marginSize,
          right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.giveReview,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.support,
                      style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    // MyRating(rating: '5',)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.functionality,
                      style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    // MyRating(rating: '5',)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.communication,
                      style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    // MyRating(rating: '5',)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.quality,
                      style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    // MyRating(rating: '5',)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 3,),
          Text(
            Strings.yourComment,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          TextFormField(
            style: CustomStyle.textStyle,
            controller: commentController,
            keyboardType: TextInputType.name,
            validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
            decoration: InputDecoration(
              hintText: Strings.contraryToPopular,
              contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
              labelStyle: CustomStyle.textStyle,
              filled: true,
              fillColor: Colors.transparent,
              hintStyle: CustomStyle.hintTextStyle,
              focusedBorder: CustomStyle.focusBorder,
              enabledBorder: CustomStyle.focusErrorBorder,
              focusedErrorBorder: CustomStyle.focusErrorBorder,
              errorBorder: CustomStyle.focusErrorBorder,
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          imageUpload(context)
        ],
      ),
    );
  }

  imageUpload(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              Strings.uploadImage,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            SizedBox(width: Dimensions.widthSize * 0.5,),
            Text(
              '(${Strings.optional})',
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize,
                  color: Colors.grey
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        GestureDetector(
          child: Container(
            height: 120,
            width: 120,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: CustomColor.secondaryColor,
              border: Border.all(color: Colors.black)
            ),
            child: _image == null ? Stack(
              children: [
                Image.asset(
                    'assets/images/man.png',
                    fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
                Center(
                  child: Icon(
                      Icons.add,
                    size: 60,
                  ),
                )
              ],
            ) : Image.file(
              _image,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            _openImageSourceOptions(context);
          },
        ),
      ],
    );
  }

  submitButtonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize * 3,
          right: Dimensions.marginSize * 3,
        ),
        child: GestureDetector(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 2)
            ),
            child: Center(
              child: Text(
                Strings.submitReview.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => DashboardScreen()));
          },
        ),
      ),
    );
  }

  Future<void> _openImageSourceOptions(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Icon(Icons.camera_alt, size: 40.0, color: Colors.blue,),
                  onTap: (){
                    Navigator.of(context).pop();
                    _chooseFromCamera();
                  },
                ),
                GestureDetector(
                  child: Icon(Icons.photo, size: 40.0, color: Colors.green,),
                  onTap: (){
                    Navigator.of(context).pop();
                    _chooseFromGallery();
                  },
                ),
              ],
            ),
          );
        });
  }

 late  File file;

  void _chooseFromGallery() async{
    ImagePicker imagePicker = ImagePicker();
    // ignore: deprecated_member_use
    file = (await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 40)) as File;

    if (file == null){
      Fluttertoast.showToast(msg: 'No File Selected');
    }else{
      setState(() {
        _image = file;
      });
      //_upload();
    }
  }

  _chooseFromCamera() async{
    ImagePicker imagePicker = ImagePicker();
    print('open camera');
    //ignore: deprecated_member_use
    file = (await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 20)) as File;

    print('picked camera');
    if (file == null){
      Fluttertoast.showToast(msg: 'No Capture Image');
    }else{
      setState(() {
        _image = file;
      });
      //_upload();
    }
  }
}
