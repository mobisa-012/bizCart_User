import 'dart:ui';

class PromotionalBanner {
  final int id;
  final String name;
  final String image;
  final Color color;

  const PromotionalBanner({required this.id, required this.name,required this.image,required this.color});
}

class PromotionalBannerList {
  static List<PromotionalBanner> list() {
    const data = <PromotionalBanner> [
      PromotionalBanner(
        id: 1,
        name: 'For All Your Summer Clothing Needs',
        image: 'assets/images/man.png',
        color: Color(0xFF752FFF),
      ),
      PromotionalBanner(
          id: 2,
          name: 'Clearance Sale Off To 70%',
          image: 'assets/images/man.png',
        color: Color(0xFF379FFF),
      ),
    ];
    return data;
  }
}