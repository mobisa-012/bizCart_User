class Fashion {
  final int id;
  final String name;
  final String image;
  final int stock;
  final String price;
  final String oldPrice;
  final String rating;
  final bool isSaved;

  const Fashion({this.id, this.name, this.image, this.stock, this.price, this.oldPrice, this
      .rating,
    this
      .isSaved});
}

class FashionList {
  static List<Fashion> list() {
    const data = <Fashion> [
      Fashion(
        id: 1,
        name: 'Blush Beanie',
        image: 'assets/images/fashion/1.png',
        stock: 0,
        price: '32',
        oldPrice: '42',
        rating: '4',
        isSaved: false
      ),
      Fashion(
          id: 2,
          name: 'Lounge Chair',
          image: 'assets/images/fashion/2.png',
          stock: 99,
          price: '479',
          oldPrice: '542',
          rating: '4',
          isSaved: false
      ),
      Fashion(
          id: 3,
          name: 'School Bag',
          image: 'assets/images/fashion/3.png',
        stock: 14,
        price: '78',
        oldPrice: '92',
        rating: '4',
        isSaved: false,
      ),
      Fashion(
          id: 1,
          name: 'Blush Beanie',
          image: 'assets/images/fashion/1.png',
          stock: 0,
          price: '32',
          oldPrice: '42',
          rating: '4',
          isSaved: false
      ),
      Fashion(
          id: 2,
          name: 'Lounge Chair',
          image: 'assets/images/fashion/2.png',
          stock: 99,
          price: '479',
          oldPrice: '542',
          rating: '4',
          isSaved: false
      ),
      Fashion(
        id: 3,
        name: 'School Bag',
        image: 'assets/images/fashion/3.png',
        stock: 14,
        price: '78',
        oldPrice: '92',
        rating: '4',
        isSaved: false,
      ),
      Fashion(
          id: 1,
          name: 'Blush Beanie',
          image: 'assets/images/fashion/1.png',
          stock: 0,
          price: '32',
          oldPrice: '42',
          rating: '4',
          isSaved: false
      ),
      Fashion(
          id: 2,
          name: 'Lounge Chair',
          image: 'assets/images/fashion/2.png',
          stock: 99,
          price: '479',
          oldPrice: '542',
          rating: '4',
          isSaved: false
      ),
      Fashion(
        id: 3,
        name: 'School Bag',
        image: 'assets/images/fashion/3.png',
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