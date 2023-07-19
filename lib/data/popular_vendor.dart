class PopularVendor {
  final int id;
  final String image;

  const PopularVendor({required this.id, required this.image});
}

class PopularVendorList {
  static List<PopularVendor> list() {
    const data = <PopularVendor> [
      PopularVendor(
        id: 1,
        image: 'assets/images/popular_vendor/1.png',
      ),
      PopularVendor(
          id: 2,
          image: 'assets/images/popular_vendor/2.png',
      ),
      PopularVendor(
          id: 3,
          image: 'assets/images/popular_vendor/3.png',
      ),
    ];
    return data;
  }
}