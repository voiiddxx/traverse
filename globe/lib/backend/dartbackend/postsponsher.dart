import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class sponsherUser {
  final String organisationname;
  final String eventname;
  final String venue;
  final String eventdate;
  final String description;
  final String audince;
  sponsherUser({
    required this.organisationname,
    required this.eventname,
    required this.venue,
    required this.eventdate,
    required this.description,
    required this.audince,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'organisationname': organisationname,
      'eventname': eventname,
      'venue': venue,
      'eventdate': eventdate,
      'description': description,
      'audince': audince,
    };
  }

  factory sponsherUser.fromMap(Map<String, dynamic> map) {
    return sponsherUser(
      organisationname: map['organisationname'] as String,
      eventname: map['eventname'] as String,
      venue: map['venue'] as String,
      eventdate: map['eventdate'] as String,
      description: map['description'] as String,
      audince: map['audince'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory sponsherUser.fromJson(String source) =>
      sponsherUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
