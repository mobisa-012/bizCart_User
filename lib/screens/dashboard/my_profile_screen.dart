// ignore_for_file: unnecessary_null_comparison

import 'package:bizcart/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

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
              HeaderWidget(name: Strings.myProfile,),
              bodyWidget(context),
              updateProfileWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -75,
              left: 0,
              right: 0,
              child: addImageWidget(context),
            ),
            detailsWidget(context)
          ],
        ),
      ),
    );
  }

  addImageWidget(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(75.0),
              ),
              child: _image == null ? Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover
              ) : Image.file(
                _image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 20,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    color: CustomColor.accentColor,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: IconButton(
                  onPressed: (){
                    _openImageSourceOptions(context);
                  },
                  padding: EdgeInsets.only(left: 5,right: 5),
                  iconSize: 24,
                  icon: Icon(
                    Icons.camera_enhance,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }

  updateProfileWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: GestureDetector(
          child: Container(
            height: Dimensions.buttonHeight,
            decoration: BoxDecoration(
                color: CustomColor.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Center(
              child: Text(
                Strings.updateProfile,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          onTap: () {
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

  late File file;

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

  detailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoData(Strings.name, Strings.demoName),
          infoData(Strings.email, Strings.demoEmail),
          infoData(Strings.address, Strings.demoAddress),
          infoData(Strings.phone, Strings.demoNumber),
        ],
      ),
    );
  }

  infoData(name, value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 0.5,),
        Text(
          value,
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey.withOpacity(0.8),),
        SizedBox(height: Dimensions.heightSize),
      ],
    );
  }

}
