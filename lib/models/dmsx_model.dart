// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Dmsxmodel {
  final String id;
  final String ca;
  final String docID;
  final String notice;
  final String employeeId;
  final String employeeName;
  final String peaNo;
  final String cusName;
  final String line;
  final String status;
  final String statusTxt;
  final String type;
  final String typeTxt;
  final String tel;
  final String address;
  final List<String> images;
  final String readNumber;
  final String lat;
  final String lng;
  final String paymentDate;
  final String dataStatus;
  final String refnoti_date;
  final String timestamp;
  final String userId;
  final String importDate;
  final String image_befor_wmmr;
  Dmsxmodel({
    required this.id,
    required this.ca,
    required this.docID,
    required this.notice,
    required this.employeeId,
    required this.employeeName,
    required this.peaNo,
    required this.cusName,
    required this.line,
    required this.status,
    required this.statusTxt,
    required this.type,
    required this.typeTxt,
    required this.tel,
    required this.address,
    required this.images,
    required this.readNumber,
    required this.lat,
    required this.lng,
    required this.paymentDate,
    required this.dataStatus,
    required this.refnoti_date,
    required this.timestamp,
    required this.userId,
    required this.importDate,
    required this.image_befor_wmmr,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ca': ca,
      'docID': docID,
      'notice': notice,
      'employeeId': employeeId,
      'employeeName': employeeName,
      'pea_no': peaNo,
      'cus_name': cusName,
      'line': line,
      'status': status,
      'status_txt': statusTxt,
      'type': type,
      'type_txt': typeTxt,
      'tel': tel,
      'address': address,
      'images': images,
      'readNumber': readNumber,
      'lat': lat,
      'lng': lng,
      'paymentDate': paymentDate,
      'dataStatus': dataStatus,
      'refnoti_date': refnoti_date,
      'timestamp': timestamp,
      'userId': userId,
      'importDate': importDate,
      'image_befor_wmmr': image_befor_wmmr,
    };
  }

  factory Dmsxmodel.fromMap(Map<String, dynamic> map) {
    return Dmsxmodel(
      id: (map['id'] ?? '') as String,
      ca: (map['ca'] ?? '') as String,
      docID: (map['docID'] ?? '') as String,
      notice: (map['notice'] ?? '') as String,
      employeeId: (map['employeeId'] ?? '') as String,
      employeeName: (map['employeeName'] ?? '') as String,
      peaNo: (map['pea_no'] ?? '') as String,
      cusName: (map['cus_name'] ?? '') as String,
      line: (map['line'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      statusTxt: (map['status_txt'] ?? '') as String,
      type: (map['type'] ?? '') as String,
      typeTxt: (map['type_txt'] ?? '') as String,
      tel: (map['tel'] ?? '') as String,
      address: (map['address'] ?? '') as String,
      images: List<String>.from(map['images'] ?? []),
      readNumber: (map['readNumber'] ?? '') as String,
      lat: (map['lat'] ?? '') as String,
      lng: (map['lng'] ?? '') as String,
      paymentDate: (map['paymentDate'] ?? '') as String,
      dataStatus: (map['dataStatus'] ?? '') as String,
      refnoti_date: (map['refnoti_date'] ?? '') as String,
      timestamp: (map['timestamp'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      importDate: (map['importDate'] ?? '') as String,
      image_befor_wmmr: (map['image_befor_wmmr'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dmsxmodel.fromJson(String source) =>
      Dmsxmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
