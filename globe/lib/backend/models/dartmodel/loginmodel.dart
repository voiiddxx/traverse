import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Loginuser {
  final String email;
  final String password;
  Loginuser({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory Loginuser.fromMap(Map<String, dynamic> map) {
    return Loginuser(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loginuser.fromJson(String source) =>
      Loginuser.fromMap(json.decode(source) as Map<String, dynamic>);
}
