import 'package:restaurant_menu_app/models/suborder.dart';

class Orders {
  Orders({
    required this.suborders,
  });

  List<SubOrder> suborders;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        suborders: List<SubOrder>.from(
          json["suborders"].map(
            (x) => SubOrder.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "suborders": List<dynamic>.from(suborders.map((x) => x.toJson())),
      };
}
