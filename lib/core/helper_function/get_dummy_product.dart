import 'dart:io';

import 'package:fruit_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'apple',
    code: '123',
    description: 'fresh apple',
    price: 10,
    isFeatured: true,
    imageUrl:
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    expirationMonths: 12,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    image: File(''),
    reviews: [],
  );
}
  List<ProductEntity> getDummyProducts() {
    return [
      getDummyProduct(),
      getDummyProduct(),
      getDummyProduct(),
      getDummyProduct(),
    ];
  }