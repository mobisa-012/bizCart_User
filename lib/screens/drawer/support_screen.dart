import 'package:flutter/material.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/data/message.dart';
import 'package:bizcart/widgets/back_widget.dart';

class SupportScreen extends StatefulWidget {

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.secondaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack (
            children: [
              BackWidget(name: Strings.support,),
              bodyWidget(context),
              typeMessageWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 80),
      child: SingleChildScrollView(
        child: Column(
          children: [
            chatWithSupportWidget(context),
            SizedBox(height: Dimensions.heightSize,),
            messagingWidget(context),
          ],
        ),
      ),
    );
  }

  Widget chatWithSupportWidget(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CustomColor.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          top: Dimensions.heightSize,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Strings.chatWithSupport,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.largeTextSize,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.heightSize,),
            ClipRRect(
              child: Image.asset(
                'assets/images/profile.png',
                height: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messagingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: MessageList.list().length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
            Message message = MessageList.list()[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: Dimensions.heightSize,),
                child: message.type != 'sender' ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Dimensions.marginSize, left: Dimensions.marginSize),
                      child: Container(
                        decoration: BoxDecoration(
                            color: CustomColor.greenLightColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius
                                .circular(30.0), bottomRight: Radius.circular(30.0) )
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                                right: Dimensions.marginSize,
                              top: Dimensions.heightSize,
                              bottom: Dimensions.heightSize
                            ),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: CustomColor.greyColor,
                                fontSize: Dimensions.defaultTextSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Dimensions.marginSize),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'seen message',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: Dimensions.extraSmallTextSize,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )
                  ],
                )
                    : Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                child: Image.asset(
                                  'assets/images/user.png',
                                  height: 20,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.name,
                                  style: TextStyle(
                                    color: CustomColor.redDarkColor,
                                    fontSize: Dimensions.smallTextSize,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  message.time,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: Dimensions.extraSmallTextSize,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                            color: CustomColor.yellowLightColor,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), bottomLeft: Radius
                                .circular(30.0), bottomRight: Radius.circular(30.0) )
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                            left: Dimensions.marginSize,
                            right: Dimensions.marginSize,
                            top: Dimensions.heightSize,
                            bottom: Dimensions.heightSize
                      ),
                      child: Text(
                            message.text,
                          style: TextStyle(
                            color: CustomColor.greyColor,
                            fontSize: Dimensions.defaultTextSize,
                          ),
                      ),
                    ),
                  ),
                ),
                        ),
                      ],
                    )
              );
            }
        ),
      ),
    );
  }

  Widget typeMessageWidget(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.marginSize),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(
                  color: Colors.black.withOpacity(0.1),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.marginSize),
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_emotions_outlined,
                        color: CustomColor.redDarkColor,
                        size: 20,
                      ),
                      Icon(
                        Icons.image,
                        color: CustomColor.redDarkColor,
                        size: 20,
                      ),
                      Form(
                          key: formKey,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextFormField(
                              style: CustomStyle.textStyle,
                              controller: messageController,
                              keyboardType: TextInputType.name,
                              validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                              decoration: InputDecoration(
                                hintText: Strings.typeMessage,
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                labelStyle: CustomStyle.textStyle,
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: CustomStyle.textStyle,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: CustomColor.primaryColor,
                      size: 18,
                    ),
                    onPressed: () {

                    }
                )
              ],
            ),
          ),
        )
    );
  }

}
