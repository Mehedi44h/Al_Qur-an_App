class Dua_sub_category_lst_model {
  int? id;
  String? name;
  String? duaCategoryId;

  Dua_sub_category_lst_model({
    this.id,
    this.name,
    this.duaCategoryId,
  });

  Dua_sub_category_lst_model.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duaCategoryId = json['dua_category_id'];
  }
}
