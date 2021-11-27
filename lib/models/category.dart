class Category {
  final int id;
  final String title;

  Category({required this.id, required this.title});


  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
  );

}