import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddAgency {
  final String agencyname;
  final String agencyaddress;
  final String agencyspan;
  final String registrationnumber;
  final String remarkablework;

  AddAgency({
    required this.agencyname,
    required this.agencyaddress,
    required this.agencyspan,
    required this.registrationnumber,
    required this.remarkablework,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'agencyname': agencyname,
      'agencyaddress': agencyaddress,
      'agencyspan': agencyspan,
      'registrationnumber': registrationnumber,
      'remarkablework': remarkablework,
    };
  }

  factory AddAgency.fromMap(Map<String, dynamic> map) {
    return AddAgency(
      agencyname: map['agencyname'] as String,
      agencyaddress: map['agencyaddress'] as String,
      agencyspan: map['agencyspan'] as String,
      registrationnumber: map['registrationnumber'] as String,
      remarkablework: map['remarkablework'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddAgency.fromJson(String source) =>
      AddAgency.fromMap(json.decode(source) as Map<String, dynamic>);
}
