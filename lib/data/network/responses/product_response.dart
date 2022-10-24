import '../../models/product_model.dart';

class ProductResponse {
  int? status;
  String? message;
  List<ProductModel>? listProducts = [];

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['products'].forEach((value) {
      listProducts?.add(ProductModel.fromJson(value));
    });
  }
}
