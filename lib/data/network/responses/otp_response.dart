import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class OtpResponse {
  int? status;
  String? message;
  AccountModel? model;

  OtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    model =
        json['acount'] != null ? AccountModel.fromJson(json['acount']) : null;
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        'account': model,
      };
}
