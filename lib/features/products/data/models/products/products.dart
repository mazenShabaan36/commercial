import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'rating.dart';
part 'products.g.dart';

@HiveType(typeId: 1)
class Products {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  double? price;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? image;
  @HiveField(6)
  Rating? rating;
  int quantity;

  Products({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.quantity = 1,
  });

  factory Products.fromJsonData(Map<String, dynamic> data) {
    return Products(
      id: data['id'] as int?,
      title: data['title'] as String?,
      price: (data['price'] as num?)?.toDouble(),
      description: data['description'] as String?,
      category: data['category'] as String?,
      image: data['image'] as String?,
      rating: data['rating'] == null
          ? null
          : Rating.fromJsonData(data['rating'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJsonData() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJsonData(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Products].
  factory Products.fromJson(String data) {
    return Products.fromJsonData(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Products] to a JSON string.
  String toJson() => json.encode(toJsonData());

  Products copyWith({int? quantity}) {
    return Products(
      id: id,
      title: title,
      image: image,
      price: price,
      category: category,
      description: description,
      rating: rating,
      quantity: quantity ?? this.quantity,
    );
  }
}
