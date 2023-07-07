
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class Product {
  final String image;
  final double price;
  final String description;
  final String title;

  Product(
      {required this.title,
      required this.price,
      required this.image,
      required this.description});

      factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
}
