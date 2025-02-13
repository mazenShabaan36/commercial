import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'rating.g.dart';

@HiveType(typeId: 3)
class Rating {
  @HiveField(0)
  double? rate;
  @HiveField(1)
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJsonData(Map<String, dynamic> data) {
    return Rating(
      rate: (data['rate'] as num?)?.toDouble(),
      count: data['count'] as int?,
    );
  }

  Map<String, dynamic> toJsonData() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Rating].
  factory Rating.fromJson(String data) {
    return Rating.fromJsonData(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Rating] to a JSON string.
  String toJson() => json.encode(toJsonData());
}
