import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterUser {
  final String username;
  final String email;
  final String password;
  final String confirmpassword;
  final String token;
  final String id;
  RegisterUser({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmpassword,
    required this.token,
    required this.id,
  });

  RegisterUser copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmpassword,
    String? token,
    String? id,
  }) {
    return RegisterUser(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
      token: token ?? this.token,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'confirmpassword': confirmpassword,
      'token': token,
      'id': id,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      confirmpassword: map['confirmpassword'] as String,
      token: map['token'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(String source) =>
      RegisterUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
