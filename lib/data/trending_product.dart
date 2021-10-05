class TrendingProduct {
  final int id;
  final String name;
  final String image;
  final int stock;
  final String price;
  final String rating;
  final bool isSaved;

  const TrendingProduct({this.id, this.name, this.image, this.stock, this.price, this.rating, this.isSaved});
}

class TrendingProductList {
  static List<TrendingProduct> list() {
    const data = <TrendingProduct> [
      TrendingProduct(
        id: 1,
        name: 'Deluxe Brand',
        image: 'assets/images/trending_product/1.png',
        stock: 142,
        price: '60',
        rating: '4.5',
        isSaved: false
      ),
      TrendingProduct(
          id: 2,
          name: 'Low Blush Bean',
          image: 'assets/images/trending_product/2.png',
          stock: 0,
          price: '479',
          rating: '5.0',
          isSaved: false
      ),
      TrendingProduct(
          id: 3,
          name: 'Black Watch',
          image: 'assets/images/trending_product/3.png',
        stock: 14,
        price: '78',
        rating: '3.2',
        isSaved: false,
      ),
    ];
    return data;
  }
}