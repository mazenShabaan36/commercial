import 'package:hive_flutter/hive_flutter.dart';
part 'category.g.dart';

@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  final String name;

  Category({required this.name});

  factory Category.fromJson(String name) {
    return Category(name: name);
  }
}
