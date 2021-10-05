import 'package:bizcart/data/best_selling.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:bizcart/widgets/about_widget.dart';
import 'package:bizcart/widgets/ask_widget.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:bizcart/widgets/review_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final BestSelling product;

  const ProductDetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
              BackWidget(name: widget.product.name,),
              Positioned(
                right: Dimensions.marginSize,
                top: Dimensions.heightSize,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.share,
                            color: CustomColor.primaryColor,
                          ),
                          onPressed: null
                      ),
                    ),
                    SizedBox(width: Dimensions.widthSize,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: CustomColor.primaryColor,
                          ),
                          onPressed: null
                      ),
                    ),
                  ],
                ),
              ),
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
            imageGalleryWidget(context),
            infoWidget(context),
            detailsWidget(context)
          ],
        ),
      ),
    );
  }

  imageGalleryWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Align(
        child: Image.asset(
          widget.product.image,
          width: 200,
          height: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  infoWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 25,
                width: 35,
                decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: CustomColor.accentColor,
                      size: 15,
                    ),
                    Text(
                      widget.product.rating,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '\$${widget.product.price}',
                    style: TextStyle(
                        color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.largeTextSize
                    ),
                  ),
                  Text(
                    '\$${widget.product.oldPrice}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.defaultTextSize,
                      decoration: TextDecoration.lineThrough
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            '\$${widget.product.name}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.largeTextSize
            ),
          ),
          Text(
            'Contrary to popular',
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.smallTextSize
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${Strings.size}: '
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('S')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('M')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('L')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text('XL')),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  detailsWidget(BuildContext context) {
    int totalPages = 3;
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
                    Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: index == 0 ? CustomColor.primaryColor : Colors.black,
                              child: Center(
                                child: Text(
                                  Strings.about,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: index == 1 ? CustomColor.primaryColor : Colors.black,
                              child: Center(
                                child: Text(
                                  Strings.review,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: index == 2 ? CustomColor.primaryColor : Colors.black,
                              child: Center(
                                child: Text(
                                  Strings.askQuestion,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
        return AboutWidget();
      case 1 :
        return ReviewWidget();
      case 2 :
        return AskWidget();
    }
  }

  buttonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: Dimensions.buttonHeight,
              decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius)
              ),
              child: Center(
                child: Text(
                  Strings.buyNow,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: Dimensions.widthSize,),
          Expanded(
            flex: 1,
            child: Container(
              height: Dimensions.buttonHeight,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.7),
                borderRadius: BorderRadius.circular(Dimensions.radius)
              ),
              child: Center(
                child: Text(
                  Strings.addToCart,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
