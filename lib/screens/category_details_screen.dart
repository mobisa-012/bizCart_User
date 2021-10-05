import 'package:bizcart/data/category.dart';
import 'package:bizcart/screens/fashion_details_screen.dart';
import 'package:bizcart/utils/colors.dart';
import 'package:bizcart/utils/dimensions.dart';
import 'package:bizcart/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final Category category;

  const CategoryDetailsScreen({Key key, this.category}) : super(key: key);
  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {

  List<String> categoryList = ['All', "Men's", "Women's", "Kids"];

  int selectedType = 0;

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
              BackWidget(name: widget.category.name,),
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
            showCategoryTypeWidget(selectedType),
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

  itemData(color, image, name, type) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: GestureDetector(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(Dimensions.radius)
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: Dimensions.marginSize * 0.5
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.extraLargeTextSize,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.5,),
                      Text(
                        type,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.largeTextSize,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize,),
                      Text(
                        'Contrary to popular belief, Lorem Ipsum is not simply random text',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.defaultTextSize,
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$89',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.extraLargeTextSize,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: Dimensions.widthSize * 0.5,),
                          Text(
                            '\$95',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.largeTextSize,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FashionDetailsScreen()));
        },
      ),
    );
  }

  showCategoryTypeWidget(index) {
    print("show: "+selectedType.toString());
    setState(() {
      selectedType = index;
    });
    switch(selectedType){
      case 0:
        return Column(
          children: [
            itemData(
                0xFFFF696A,
                'assets/images/skirt.png',
                'Ladies Skirt',
                'Women'
            ),
            SizedBox(height: Dimensions.heightSize,),
            itemData(
                0xFF379FFF,
                'assets/images/games.png',
                'Brain Games',
                'Kids'
            ),
            SizedBox(height: Dimensions.heightSize,),
            itemData(
                0xFFFFBE00,
                'assets/images/tshirt.png',
                'T-Shirt',
                'Men'
            ),
          ],
        );
      case 1:
        return itemData(
            0xFFFFBE00,
            'assets/images/tshirt.png',
            'T-Shirt',
            'Men'
        );
      case 2:
        return Container(
          child: itemData(
              0xFFFF696A,
              'assets/images/skirt.png',
              'Ladies Skirt',
              'Women'
          ),
        );
      case 3:
        return Container(
          child: itemData(
              0xFF379FFF,
              'assets/images/games.png',
              'Brain Games',
              'Kids'
          ),
        );
    }
  }
}
