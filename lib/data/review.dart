class Review {
  final int id;
  final String name;
  final String image;
  final String discount;
  final String oldPrice;
  final String newPrice;
  final String rating;
  final String piece;
  final String orderId;
  final String status;
  final String date;

  const Review({this.id, this.name, this.image, this.discount, this.oldPrice, this.newPrice,
    this.rating, this.piece, this.orderId, this.status, this.date});
}

class ReviewList {
  static List<Review> list() {
    const data = <Review> [
      Review(
        id: 1,
        name: 'Black Watch',
        image: 'assets/images/cart/3.png',
        discount: '45',
        oldPrice: '100.00',
        newPrice: '55.00',
        rating: '5.0',
        piece: '50',
        orderId: 'SGW124578',
        status: 'Review',
        date: '27 jan, 2021'
      ),
      Review(
          id: 2,
          name: 'Lounge Chair',
          image: 'assets/images/cart/2.png',
          discount: '20',
          oldPrice: '80.00',
          newPrice: '64.00',
          rating: '5.0',
          piece: '150',
          orderId: 'RFA124578',
          status: 'Review',
          date: '19 jan, 2021'
      ),
      Review(
          id: 3,
          name: 'Low Blush Bean',
          image: 'assets/images/cart/1.png',
          discount: '45',
          oldPrice: '100.00',
          newPrice: '55.00',
          rating: '5.0',
          piece: '50',
          orderId: 'RAF424578',
          status: 'Review',
          date: '07 jan, 2021'
      ),
    ];
    return data;
  }
}