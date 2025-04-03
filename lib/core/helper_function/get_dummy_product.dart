import 'dart:io';

import 'package:fruit_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'apple',
    code: '123',
    description: 'fresh apple',
    price: 10,
    isFeatured: true,
    imageUrl: null,
    expirationMonths: 12,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
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
