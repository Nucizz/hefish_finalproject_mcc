import 'package:flutter/cupertino.dart';
import 'package:hefish_finalproject/class/fish_type.dart';

class Fishes {
  int id;
  int authorId;
  String authorName = "Unknown";
  int typeId;
  String typeName = "Undifined";

  String name = "NULL";
  String price = "Rp0,00";
  String imagePath;
  String description;

  Fishes(
      {required this.id,
      required this.authorId,
      required this.authorName,
      required this.typeId,
      required this.typeName,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.description});

  factory Fishes.fromJson(Map<String, dynamic> json) {
    return Fishes(
      id: json['id'] as int,
      authorId: json['authorId'] as int,
      authorName: json['authorName'].toString(),
      typeId: json['typeId'] as int,
      typeName: json['typeName'].toString(),
      name: json['name'].toString(),
      price: json['price'].toString(),
      imagePath: json['imagepath'].toString(),
      description: json['description'].toString(),
    );
  }
}
