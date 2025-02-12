import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'cart_product.dart';
part 'cart.g.dart';
@HiveType(typeId: 2)
class Cart {
  @HiveField(0)
  int? id;
  @HiveField(2)
  int? userId;
  @HiveField(3)
  DateTime? date;
  @HiveField(4)
  List<CartProduct>? products;
  @HiveField(5)
  int? v;

  Cart({this.id, this.userId, this.date, this.products, this.v});

  factory Cart.fromJsonData(Map<String, dynamic> data) {
    return Cart(
      id: data['id'] as int?,
      userId: data['userId'] as int?,
      date:
          data['date'] == null ? null : DateTime.parse(data['date'] as String),
      products: (data['products'] as List<dynamic>?)
          ?.map((e) => CartProduct.fromJsonData(e as Map<String, dynamic>))
          .toList(),
      v: data['__v'] as int?,
    );
  }

  Map<String, dynamic> toJsonData() {
    return {
      'id': id,
      'userId': userId,
      'date': date?.toIso8601String(),
      'products': products?.map((e) => e.toJsonData()).toList(),
      '__v': v,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cart].
  factory Cart.fromJson(String data) {
    return Cart.fromJsonData(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cart] to a JSON string.
  String toJson() => json.encode(toJsonData());
}
