import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchDmsxModel {

  final String employeeName;
  final String cus_name;
  final String status_txt;
  final String lat;
  final String lng;
  final String latMobile;
  final String lngMobile;
  final String timestamp;
  SearchDmsxModel({
    required this.employeeName,
    required this.cus_name,
    required this.status_txt,
    required this.lat,
    required this.lng,
    required this.latMobile,
    required this.lngMobile,
    required this.timestamp,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employeeName': employeeName,
      'cus_name': cus_name,
      'status_txt': status_txt,
      'lat': lat,
      'lng': lng,
      'latMobile': latMobile,
      'lngMobile': lngMobile,
      'timestamp': timestamp,
    };
  }

  factory SearchDmsxModel.fromMap(Map<String, dynamic> map) {
    return SearchDmsxModel(
      employeeName: (map['employeeName'] ?? '') as String,
      cus_name: (map['cus_name'] ?? '') as String,
      status_txt: (map['status_txt'] ?? '') as String,
      lat: (map['lat'] ?? '') as String,
      lng: (map['lng'] ?? '') as String,
      latMobile: (map['latMobile'] ?? '') as String,
      lngMobile: (map['lngMobile'] ?? '') as String,
      timestamp: (map['timestamp'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchDmsxModel.fromJson(String source) => SearchDmsxModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
