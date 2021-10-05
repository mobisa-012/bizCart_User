import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:flutter/material.dart';

class AskWidget extends StatelessWidget {

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.heightSize,
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
          ),
          child: TextFormField(
            style: CustomStyle.textStyle,
            controller: commentController,
            keyboardType: TextInputType.text,
            validator: (String value){
              if(value.isEmpty){
                return Strings.pleaseFillOutTheField;
              }else{
                return null;
              }
            },
            decoration: InputDecoration(
                hintText: Strings.typeMessage,
                contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                labelStyle: CustomStyle.textStyle,
                filled: true,
                fillColor: Colors.white,
                hintStyle: CustomStyle.textStyle,
                focusedBorder: CustomStyle.focusBorder,
                enabledBorder: CustomStyle.focusErrorBorder,
                focusedErrorBorder: CustomStyle.focusErrorBorder,
                errorBorder: CustomStyle.focusErrorBorder,
            ),
          ),
        ),
        Container(
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
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: CustomColor.primaryColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                                ),
                                child: Center(
                                  child: Text(
                                    'Q',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'But I must explain to you how all this mistaken idea of denouncing pleasure',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.extraSmallTextSize
                                ),
                              ),
                              SizedBox(height: Dimensions.heightSize * 0.5,),
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
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.heightSize,),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.marginSize * 2
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: CustomColor.accentColor,
                                      borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                                  ),
                                  child: Center(
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'But I must explain to you how all this mistaken idea of denouncing pleasure',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.extraSmallTextSize
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize * 0.5,),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
