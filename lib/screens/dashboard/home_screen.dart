import 'package:bizcart/data/best_selling.dart';
import 'package:bizcart/data/category.dart';
import 'package:bizcart/data/popular_vendor.dart';
import 'package:bizcart/data/promotional_banner.dart';
import 'package:bizcart/data/trending_product.dart';
import 'package:bizcart/screens/auth/sign_in_screen.dart';
import 'package:bizcart/screens/category_details_screen.dart';
import 'package:bizcart/screens/drawer/coupon_screen.dart';
import 'package:bizcart/screens/filter_screen.dart';
import 'package:bizcart/screens/notification_screen.dart';
import 'package:bizcart/screens/product_details_screen.dart';
import 'package:bizcart/screens/drawer/support_screen.dart';
import 'package:bizcart/screens/drawer/change_password_screen.dart';
import 'package:bizcart/screens/drawer/my_reviews_screen.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/custom_style.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/utils/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryIconTheme: IconThemeData(
              color: Colors.black
          )
      ),
      child: Scaffold(
        backgroundColor: CustomColor.secondaryColor,

        drawer: Drawer(

          child: Container(
            color: CustomColor.secondaryColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: profileWidget(context),
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                  ),
                ),
                listData('assets/images/icon/return.png', Strings.changePassword,
                  ChangePasswordScreen()),
                listData('assets/images/icon/coupon.png', Strings.coupons, CouponScreen()),
                listData('assets/images/icon/review.png', Strings.myReviews, MyReviewsScreen()),
                listData('assets/images/icon/support.png', Strings.support, SupportScreen()),
                listData('assets/images/icon/signout.png', Strings.singOut, SignInScreen()),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            headerWidget(context),
            categoryWidget(context),
            bannerWidget(context),
            popularVendorWidget(context),
            bestSellingWidget(context),
            trendingProductWidget(context)
          ],
        ),
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize * 3,),
      child: ListTile(
        leading: Image.asset(
          'assets/images/profile.png',
        ),
        title: Text(
          Strings.demoName,
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          Strings.demoEmail,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.defaultTextSize,
          ),
        ),
      ),
    );
  }

  listData(String icon, String title, Widget goTo) {
    return ListTile(
      leading: Image.asset(
          icon
      ),
      title: Text(
        title,
        style: CustomStyle.listStyle,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        goTo));
      },
    );
  }

  headerWidget(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 120.0,
      backgroundColor: CustomColor.secondaryColor,
      title: Text(
        Strings.appName,
        style: TextStyle(
            color: Colors.black
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () {
                print("Tapped on search");
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black.withOpacity(0.1))
                ),
                margin:
                EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                // height: 60,

                // padding: ,
                child: TextField(
                  controller: searchController,
                  enabled: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: "Search Your Product",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      fillColor: Colors.transparent
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
          icon: Icon(Icons.notifications_outlined),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilterScreen()));
          },
          icon: Icon(Icons.filter_alt_outlined),
          color: Colors.black,
        ),
      ],
    );
  }

  categoryWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Text(
              Strings.categories,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: CategoryList.list().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Category category = CategoryList.list()[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize * 0.5,
                    top: 5,
                    bottom: 5
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: category.color,
                              borderRadius: BorderRadius.circular(Dimensions.radius),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColor.primaryColor.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.asset(
                            category.image,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          CategoryDetailsScreen(category: category,)));
                        },
                      ),
                      SizedBox(height: Dimensions.heightSize,),
                      Text(
                        category.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.defaultTextSize
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  bannerWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: PromotionalBannerList.list().length,
          itemBuilder: (context, index) {
            PromotionalBanner banner = PromotionalBannerList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                top: Dimensions.heightSize
              ),
              child: Container(
                height: 150,
                width: 250,
                decoration: BoxDecoration(
                    color: banner.color,
                    borderRadius: BorderRadius.circular(Dimensions.radius)
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            banner.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.extraLargeTextSize
                            ),
                          ),
                          SizedBox(height: Dimensions.heightSize,),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                                color: CustomColor.accentColor,
                                borderRadius: BorderRadius.circular(Dimensions.radius)
                            ),
                            child: Center(
                              child: Text(
                                Strings.shopNow,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.largeTextSize
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                          banner.image
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  popularVendorWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.heightSize,),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Text(
              Strings.popularVendor,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: PopularVendorList.list().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                PopularVendor popularVendor = PopularVendorList.list()[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: 5,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Container(
                    height: 80,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        popularVendor.image
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bestSellingWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.heightSize,),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.bestSelling,
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.black
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: BestSellingList.list().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                BestSelling bestSelling = BestSellingList.list()[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: 5,
                    top: 10,
                    bottom: 10,
                  ),
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
                          Padding(
                            padding: const EdgeInsets.only(
                              top: Dimensions.heightSize * 0.5,
                              left: Dimensions.marginSize * 0.5,
                              right: Dimensions.marginSize * 0.5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                bestSelling.stock == 0 ? Container(
                                  height: 25,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: CustomColor.primaryColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sold Out',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.extraSmallTextSize
                                      ),
                                    ),
                                  ),
                                ) : Container(),
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                  size: 25,
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              bestSelling.image
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
                                  bestSelling.name,
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
                                      '\$${bestSelling.price}'
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: CustomColor.accentColor,
                                          size: 15.0,
                                        ),
                                        Text(
                                          bestSelling.rating
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      ProductDetailsScreen(product: bestSelling,)));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  trendingProductWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.heightSize,),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.trendingProduct,
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.black
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: TrendingProductList.list().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                TrendingProduct trendingProduct = TrendingProductList.list()[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: 5,
                    top: 10,
                    bottom: 10,
                  ),
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
                        Padding(
                          padding: const EdgeInsets.only(
                            top: Dimensions.heightSize * 0.5,
                            left: Dimensions.marginSize * 0.5,
                            right: Dimensions.marginSize * 0.5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              trendingProduct.stock == 0 ? Container(
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: CustomColor.primaryColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
                                ),
                                child: Center(
                                  child: Text(
                                    'Sold Out',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.extraSmallTextSize
                                    ),
                                  ),
                                ),
                              ) : Container(),
                              Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            trendingProduct.image
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
                                trendingProduct.name,
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
                                    '\$${trendingProduct.price}'
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: CustomColor.accentColor,
                                        size: 15.0,
                                      ),
                                      Text(
                                        trendingProduct.rating
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
