// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.result,
  });

  List<Result> result;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.name,
    this.id,
    this.childrenList,
    this.categoryId
  });

  String name;
  int id;
  List<Result> childrenList;
  int categoryId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["Name"],
    id: json["ID"],
    childrenList: List<Result>.from(json["ChildernList"].map((x) => Result.fromJson(x))),
    categoryId: json["CategoryID"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "ID": id,
    "ChildernList": List<dynamic>.from(childrenList.map((x) => x.toJson())),
    "CategoryID": categoryId,
  };
}