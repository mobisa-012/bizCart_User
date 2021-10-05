import 'package:bizcart/data/order.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: OrderList.list().length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Order order = OrderList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                  top: Dimensions.heightSize
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.greyColor.withOpacity(0.1),
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
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderId,
                            style: TextStyle(
                                fontSize: Dimensions.largeTextSize,
                                color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: Dimensions.heightSize * 0.5,),
                          Text(
                            '\$${order.newPrice}',
                            style: TextStyle(
                                fontSize: Dimensions.defaultTextSize,
                                color: CustomColor.primaryColor
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                              color: order.status == 'Picked' ? order.status == 'Delivered' ?
                              Colors.green : CustomColor.accentColor : CustomColor.primaryColor,
                              borderRadius: BorderRadius.circular(12.5)
                            ),
                            child: Center(
                              child: Text(
                                order.status,
                                style: TextStyle(
                                    fontSize: Dimensions.smallTextSize,
                                    color: order.status == 'Picked' ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.heightSize * 0.5,),
                          Text(
                            order.date,
                            style: TextStyle(
                                fontSize: Dimensions.defaultTextSize,
                                color: CustomColor.greyColor
                            ),
                          ),
                        ],
                      ),
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

}
