import 'dart:io';

import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/model/review_model.dart';

class ProductModel {
  final num sellingCount;
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int nomberOfCalories;
  final num averageRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.sellingCount,
    required this.reviews,
    required this.expirationMonths,
    required this.nomberOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.isOrganic = false,
    this.imageUrl,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      sellingCount: json['sellingCount'],
      name: json['name'],
      code: json['code'],

      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationMonths: json['expirationMonths'],
      nomberOfCalories: json['nomberOfCalories'],
      unitAmount: json['unitAmount'],
      isOrganic: json['isOrganic'],
      reviews:
          json['reviews'] != null
              ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)),
              )
              : [],
      image: File(json['image']),
    );
  }

  tojson() {
    return {
      'sellingCount': sellingCount,
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'nomberOfCalories': nomberOfCalories,
      'unitAmount': unitAmount,
      ' isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.tojson()).toList(),
    };
  }
}
