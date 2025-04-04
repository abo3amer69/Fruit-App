import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/entities/review_entity.dart';


class ProductEntity extends Equatable{
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num averageRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity>reviews;

  ProductEntity( {
    required this.reviews,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,

    required this.isFeatured,
    this.isOrganic = false,
    this.imageUrl,
  });
  
  @override
  
  List<Object?> get props => [code];
}
