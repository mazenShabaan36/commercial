import 'dart:convert';

class CartProduct {
  int? productId;
  int? quantity;

  CartProduct({this.productId, this.quantity});

  factory CartProduct.fromJsonData(
      Map<String, dynamic> data) {
    return CartProduct(
      productId: data['productId'] as int?,
      quantity: data['quantity'] as int?,
    );
  }

  Map<String, dynamic>
      toJsonData() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CartProduct].
  factory CartProduct.fromJson(String data) {
    return CartProduct
        .fromJsonData(
            json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CartProduct] to a JSON string.
  String toJson() => json.encode(
      toJsonData());
}
