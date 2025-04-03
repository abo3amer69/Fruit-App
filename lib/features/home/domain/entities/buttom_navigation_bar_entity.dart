import 'package:fruit_app/core/utils/app_images.dart';

class ButtomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  ButtomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<ButtomNavigationBarEntity> get buttomNavigationBarItems => [
  ButtomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldHome,
    inActiveImage: Assets.assetsImagesVuesaxOutlineHome,
    name: 'الرئيسية',
  ),

  ButtomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldProducts,
    inActiveImage: Assets.assetsImagesVuesaxOutlineProducts,
    name: 'المنتجات',
  ),

  ButtomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldShoppingCart,
    inActiveImage: Assets.assetsImagesVuesaxOutlineShoppingCart,
    name: 'سله التسوق',
  ),
  ButtomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldUser,
    inActiveImage: Assets.assetsImagesVuesaxOutlineUser,
    name: 'حسابي',
  ),
];
