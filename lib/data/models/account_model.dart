class AccountModel {
  int? id;
  String? name;
  String? phone;

  AccountModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
