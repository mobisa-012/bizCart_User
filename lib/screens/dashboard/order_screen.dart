import 'package:flutter/material.dart';

import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/widgets/header_widget.dart';
import 'package:bizcart/widgets/order_status_widget.dart';
import 'package:bizcart/widgets/order_tracking_widget.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

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
              HeaderWidget(name: Strings.myOrder,),
              bodyWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 70
      ),
      child: detailsWidget(context),
    );
  }

  detailsWidget(BuildContext context) {
    int totalPages = 2;
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: PageView.builder(
          itemCount: totalPages,
          itemBuilder: (context, index) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize
                      ),
                      child: Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.orderStatus,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.defaultTextSize,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    height: 2,
                                    color: index == 0 ? CustomColor.primaryColor : Colors.grey
                                        .withOpacity(0.2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: Dimensions.widthSize * 6,),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.trackMyOrder,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.defaultTextSize,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    height: 2,
                                    color: index == 1 ? CustomColor.primaryColor : Colors.grey.withOpacity(0.2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: pageViewWidget(index),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  pageViewWidget(int i) {
    switch(i) {
      case 0 :
        return OrderStatusWidget();
      case 1 :
        return OrderTrackingWidget();
    }
  }
}
