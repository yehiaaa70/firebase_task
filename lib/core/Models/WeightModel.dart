// To parse this JSON data, do
//
//     final weightModel = weightModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<WeightModel> weightModelFromJson(String str) => List<WeightModel>.from(
    json.decode(str).map((x) => WeightModel.fromJson(x)));

String weightModelToJson(List<WeightModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeightModel {
  WeightModel({
    this.id,
    this.weight,
    this.date,
  });

  String? id;
  String? weight;
  String? date;

  factory WeightModel.fromJson(Map<String, dynamic> json) => WeightModel(
        id: json["id"],
        weight: json["weight"],
        date: json["date"],
      );

  WeightModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["id"],
        weight = doc.data()!["weight"],
        date = doc.data()!["date"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "date": date,
      };
}
