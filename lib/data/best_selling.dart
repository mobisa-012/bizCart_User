class BestSelling {
  final int id;
  final String name;
  final String image;
  final int stock;
  final String price;
  final String oldPrice;
  final String rating;
  final bool isSaved;

  const BestSelling({required this.id, required this.name, required this.image, required this.stock, required this.price, required this.oldPrice, required this
      .rating,
    required this
      .isSaved});
}

class BestSellingList {
  static List<BestSelling> list() {
    const data = <BestSelling> [
      BestSelling(
        id: 1,
        name: 'Blush Beanie',
        image: 'assets/images/best_selling/1.png',
        stock: 0,
        price: '32',
        oldPrice: '42',
        rating: '4',
        isSaved: false
      ),
      BestSelling(
          id: 2,
          name: 'Lounge Chair',
          image: 'assets/images/best_selling/2.png',
          stock: 99,
          price: '479',
          oldPrice: '542',
          rating: '4',
          isSaved: false
      ),
      BestSelling(
          id: 3,
          name: 'School Bag',
          image: 'assets/images/best_selling/3.png',
        stock: 14,
        price: '78',
        oldPrice: '92',
        rating: '4',
        isSaved: false,
      ),
    ];
    return data;
  }
}