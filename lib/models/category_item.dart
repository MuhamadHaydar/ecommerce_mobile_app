import 'package:restaurant_menu_app/models/category.dart';

class ItemOfCategory {
  final String title;
  final int id;
  final int cId;
  final double price;
  final String image;
  final String category;


  ItemOfCategory({
    required this.title,
    required this.id,
    required this.cId,
    required this.price,
    required this.image,
    required this.category
  });


  factory ItemOfCategory.fromJson(Map<String, dynamic> json) => ItemOfCategory(
    id: json["id"],
    cId: json["c_id"],
    title: json["title"],
    price: double.parse(json["price"].toString()),
    image: json["image"],
    category: json["category_title"]
  );


}
