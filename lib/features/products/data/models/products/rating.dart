import 'dart:convert';

class Rating {
  double? rate;
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
