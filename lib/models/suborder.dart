class SubOrder {
  SubOrder({
    required this.menu,
    required this.category,
    required this.quantity,
    required this.cost,
    required this.totalCost,
    this.imageUrl = "",
    this.title = ""
  }
  );

  String menu;
  String category;
  int quantity;
  double cost;
  double totalCost;
  String imageUrl;
  String title;


  factory SubOrder.fromJson(Map<String, dynamic> json) => SubOrder(
        menu: json["menu"],
        category: json["category"],
        quantity: json["quantity"],
        cost: json["cost"].toDouble(),
        totalCost: json["total_cost"],
      );

  Map<String, dynamic> toJson() => {
        "menu": menu,
        "category": category,
        "quantity": quantity,
        "cost": cost,
        "total_cost": totalCost,
      };
}
