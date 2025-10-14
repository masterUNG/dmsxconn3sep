import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DmsxLoadModel {

  final String id;
  final String desc;
  
  DmsxLoadModel({
    required this.id,
    required this.desc,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'desc': desc,
    };
  }

  factory DmsxLoadModel.fromMap(Map<String, dynamic> map) {
    return DmsxLoadModel(
      id: (map['id'] ?? '') as String,
      desc: (map['desc'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DmsxLoadModel.fromJson(String source) => DmsxLoadModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
