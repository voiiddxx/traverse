import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class hireUser {
  final String name;
  final String email;
  final String mobilenumber;
  final String product;
  final String productcategory;
  hireUser({
    required this.name,
    required this.email,
    required this.mobilenumber,
    required this.product,
    required this.productcategory,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'mobilenumber': mobilenumber,
      'product': product,
      'productcategory': productcategory,
    };
  }

  factory hireUser.fromMap(Map<String, dynamic> map) {
    return hireUser(
      name: map['name'] as String,
      email: map['email'] as String,
      mobilenumber: map['mobilenumber'] as String,
      product: map['product'] as String,
      productcategory: map['productcategory'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory hireUser.fromJson(String source) =>
      hireUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
