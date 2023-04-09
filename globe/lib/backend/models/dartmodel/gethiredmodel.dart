// To parse this JSON data, do
//
//     final gethired = gethiredFromJson(jsonString);

import 'dart:convert';

List<Gethired> gethiredFromJson(String str) =>
    List<Gethired>.from(json.decode(str).map((x) => Gethired.fromJson(x)));

String gethiredToJson(List<Gethired> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gethired {
  Gethired({
    required this.id,
    required this.name,
    required this.email,
    required this.product,
    required this.productcategory,
    required this.v,
    this.mobilenumber,
  });

  String id;
  String name;
  String email;
  String product;
  String productcategory;
  int v;
  String? mobilenumber;

  factory Gethired.fromJson(Map<String, dynamic> json) => Gethired(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        product: json["product"],
        productcategory: json["productcategory"],
        v: json["__v"],
        mobilenumber: json["mobilenumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "product": product,
        "productcategory": productcategory,
        "__v": v,
        "mobilenumber": mobilenumber,
      };
}
