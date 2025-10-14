import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {

  final String user_id;
  final String username;
  final String staffname;
  final String user_branch;
  final String user_type;




  UserModel({
    required this.user_id,
    required this.username,
    required this.staffname,
    required this.user_branch,
    required this.user_type,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': user_id,
      'username': username,
      'staffname': staffname,
      'user_branch': user_branch,
      'user_type': user_type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user_id: (map['user_id'] ?? '') as String,
      username: (map['username'] ?? '') as String,
      staffname: (map['staffname'] ?? '') as String,
      user_branch: (map['user_branch'] ?? '') as String,
      user_type: (map['user_type'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
