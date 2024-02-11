import 'package:flutter/material.dart';

class BrouchersData{
  final String nameOfTheFile; // tittle
  final String filePath; // image
  final String description; // description
  final String  type; // type
  final String id; // id
  
  const BrouchersData({
    required this.id,
    required this.nameOfTheFile,
    required this.description,
    required this.filePath,
    required this.type
  });

  factory BrouchersData.fromJson(Map<String, dynamic> json) {
    
   return BrouchersData(
            id: json['id'].toString(),
            nameOfTheFile: json['title'],
            description: json['description'],
            filePath: json['image'],
            type: json['type'],
          );
    }

  static List<BrouchersData> fromJsonList(List<dynamic> jsonList) {
     return jsonList.map((json) => BrouchersData.fromJson(json)).toList();
  }

}