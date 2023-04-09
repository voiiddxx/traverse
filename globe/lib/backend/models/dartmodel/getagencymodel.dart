import 'dart:convert';

List<Getagency> getagencyFromJson(String str) =>
    List<Getagency>.from(json.decode(str).map((x) => Getagency.fromJson(x)));

String getagencyToJson(List<Getagency> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getagency {
  Getagency({
    required this.id,
    required this.agencyname,
    required this.registrationnumber,
    required this.agencyspan,
    required this.agencyaddress,
    this.agencyimage,
    required this.v,
    this.remarkablework,
  });

  String id;
  String agencyname;
  String registrationnumber;
  String agencyspan;
  String agencyaddress;
  String? agencyimage;
  int v;
  String? remarkablework;

  factory Getagency.fromJson(Map<String, dynamic> json) => Getagency(
        id: json["_id"],
        agencyname: json["agencyname"],
        registrationnumber: json["registrationnumber"],
        agencyspan: json["agencyspan"],
        agencyaddress: json["agencyaddress"],
        agencyimage: json["agencyimage"],
        v: json["__v"],
        remarkablework: json["remarkablework"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "agencyname": agencyname,
        "registrationnumber": registrationnumber,
        "agencyspan": agencyspan,
        "agencyaddress": agencyaddress,
        "agencyimage": agencyimage,
        "__v": v,
        "remarkablework": remarkablework,
      };
}
