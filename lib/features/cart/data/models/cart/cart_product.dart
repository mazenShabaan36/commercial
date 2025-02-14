import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'cart_product.g.dart';
@HiveType(typeId: 4)
class CartProduct {
  @HiveField(0)
  int? productId;
  @HiveField(1)
  int? quantity;

  CartProduct({this.productId, this.quantity});

  factory CartProduct.fromJsonData(Map<String, dynamic> data) {
    return CartProduct(
      productId: data['productId'] as int?,
      quantity: data['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJsonData() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CartProduct].
  factory CartProduct.fromJson(String data) {
    return CartProduct.fromJsonData(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CartProduct] to a JSON string.
  String toJson() => json.encode(toJsonData());
}
