class Cart {
  final int id;
  final String name;
  final String image;
  final String discount;
  final String oldPrice;
  final String newPrice;
  final String rating;
  final String piece;

  const Cart({this.id, this.name, this.image, this.discount, this.oldPrice, this.newPrice,
    this.rating, this.piece});
}

class CartList {
  static List<Cart> list() {
    const data = <Cart> [
      Cart(
        id: 1,
        name: 'Black Watch',
        image: 'assets/images/cart/3.png',
        discount: '45',
        oldPrice: '100.00',
        newPrice: '55.00',
        rating: '5.0',
        piece: '50',
      ),
      Cart(
          id: 2,
          name: 'Lounge Chair',
          image: 'assets/images/cart/2.png',
          discount: '20',
          oldPrice: '80.00',
          newPrice: '64.00',
          rating: '5.0',
          piece: '150',
      ),
      Cart(
          id: 3,
          name: 'Low Blush Bean',
          image: 'assets/images/cart/1.png',
          discount: '45',
          oldPrice: '100.00',
          newPrice: '55.00',
          rating: '5.0',
          piece: '50',
      ),
    ];
    return data;
  }
}