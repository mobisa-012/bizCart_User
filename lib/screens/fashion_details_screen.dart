import 'package:bizcart/data/fashion.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FashionDetailsScreen extends StatefulWidget {
  @override
  _FashionDetailsScreenState createState() => _FashionDetailsScreenState();
}

class _FashionDetailsScreenState extends State<FashionDetailsScreen> {

  List<String> categoryList = ['All', "Men's", "Women's", "Kids"];

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
              BackWidget(name: Strings.fashion,),
              bodyWidget(context),
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
            categoryTypeWidget(context),
            SizedBox(height: Dimensions.heightSize,),
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                itemCount: FashionList.list().length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  Fashion fashion = FashionList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.primaryColor.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: Dimensions.marginSize * 0.5,
                              top: Dimensions.heightSize * 0.5,
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                  fashion.image
                              ),
                            ),
                            Positioned(
                              bottom: Dimensions.heightSize * 0.5,
                              left: Dimensions.marginSize * 0.5,
                              right: Dimensions.marginSize * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fashion.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.heightSize * 0.5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '\$${fashion.price}'
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: CustomColor.accentColor,
                                            size: 15.0,
                                          ),
                                          Text(
                                              fashion.rating
                                          ),
                                          SizedBox(width: Dimensions.widthSize * 0.5,),
                                          Icon(
                                            Icons.favorite_border,
                                            color: CustomColor.primaryColor,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            ProductDetailsScreen(product: bestSelling,)));*/
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  categoryTypeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: ToggleSwitch(
        initialLabelIndex: 0,
        labels: categoryList,
        inactiveBgColor: CustomColor.primaryColor.withOpacity(0.2),
        onToggle: (index) {
          print('switched to: $index');
        },
      ),
    );
  }
}
