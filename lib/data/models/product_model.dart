class ProductModel {
  late int id;
  late String company;
  late String name;
  late String type;
  late String price;
  late String image;
  late String description;

  ProductModel(this.id, this.company, this.name, this.type, this.price,
      this.image, this.description);

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }
}
