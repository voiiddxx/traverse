// To parse this JSON data, do
//
//     final getsponshernow = getsponshernowFromJson(jsonString);

import 'dart:convert';

List<Getsponshernow> getsponshernowFromJson(String str) =>
    List<Getsponshernow>.from(
        json.decode(str).map((x) => Getsponshernow.fromJson(x)));

String getsponshernowToJson(List<Getsponshernow> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getsponshernow {
  Getsponshernow({
    required this.id,
    required this.organizationname,
    required this.eventname,
    required this.eventdate,
    required this.address,
    required this.description,
    required this.audince,
    required this.v,
  });

  String id;
  String organizationname;
  String eventname;
  String eventdate;
  String address;
  String description;
  String audince;
  int v;

  factory Getsponshernow.fromJson(Map<String, dynamic> json) => Getsponshernow(
        id: json["_id"],
        organizationname: json["organizationname"],
        eventname: json["eventname"],
        eventdate: json["eventdate"],
        address: json["address"],
        description: json["description"],
        audince: json["audince"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "organizationname": organizationname,
        "eventname": eventname,
        "eventdate": eventdate,
        "address": address,
        "description": description,
        "audince": audince,
        "__v": v,
      };
}
