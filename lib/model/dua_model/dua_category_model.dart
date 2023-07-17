class Category {
  int? id;
  String? name;
  // String? language_id;


  Category({
    this.id,
    this.name,
    // this.language_id,
  });

  Category.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // language_id=json['language_id'];
  }
}
