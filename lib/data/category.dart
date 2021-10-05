import 'dart:ui';

class Category {
  final int id;
  final String name;
  final String image;
  final Color color;

  const Category({this.id, this.name, this.image, this.color});
}

class CategoryList {
  static List<Category> list() {
    const data = <Category> [
      Category(
        id: 1,
        name: 'Fashion',
        image: 'assets/images/category/1.png',
        color: Color(0xFFFFBE00),
      ),
      Category(
          id: 2,
          name: 'Women',
          image: 'assets/images/category/2.png',
        color: Color(0xFFFF696A),
      ),
      Category(
          id: 3,
          name: 'Devices',
          image: 'assets/images/category/3.png',
        color: Color(0xFF379FFF),
      ),
      Category(
          id: 4,
          name: 'Kids',
          image: 'assets/images/category/4.png',
        color: Color(0xFF752FFF),
      ),
      Category(
          id: 5,
          name: 'Electronic',
          image: 'assets/images/category/5.png',
        color: Color(0xFFFE14C7),
      ),
      Category(
          id: 6,
          name: 'Beauty',
          image: 'assets/images/category/6.png',
        color: Color(0xFF11ABCB),
      ),
    ];
    return data;
  }
}