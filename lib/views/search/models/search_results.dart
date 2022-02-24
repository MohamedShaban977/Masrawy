// To parse this JSON data, do
//
//     final searchResultModel = searchResultModelFromJson(jsonString);

import 'dart:convert';

SearchResultModel searchResultModelFromJson(String str) => SearchResultModel.fromJson(json.decode(str));

String searchResultModelToJson(SearchResultModel data) => json.encode(data.toJson());

class SearchResultModel {
  SearchResultModel({
    this.success,
    this.exception,
    this.result,
  });

  bool success;
  dynamic exception;
  List<Result> result;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => SearchResultModel(
    success: json["Success"],
    exception: json["Exception"],
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Exception": exception,
    "Result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.postId,
    this.headline,
    this.description,
    this.postUrl,
    this.imageUrl,
    this.thumbUrl,
    this.imageCaption,
    this.displayDate,
    this.originalDisplayDate,
    this.views,
    this.categoryId,
    this.categoryUrl,
    this.categoryName,
    this.categoryDisplayName,
    this.rootCategoryId,
    this.rootCategoryName,
    this.rootCategoryDisplayName,
    this.authorImage,
    this.nextPostId,
    this.nextPostDisplayDate,
  });

  int postId;
  String headline;
  String description;
  String postUrl;
  String imageUrl;
  String thumbUrl;
  String imageCaption;
  String displayDate;
  String originalDisplayDate;
  int views;
  int categoryId;
  String categoryUrl;
  String categoryName;
  String categoryDisplayName;
  int rootCategoryId;
  String rootCategoryName;
  String rootCategoryDisplayName;
  String authorImage;
  int nextPostId;
  String nextPostDisplayDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    postId: json["PostId"],
    headline: json["Headline"],
    description: json["Description"],
    postUrl: json["PostUrl"],
    imageUrl: json["ImageUrl"],
    thumbUrl: json["ThumbUrl"],
    imageCaption: json["ImageCaption"],
    displayDate: json["DisplayDate"],
    originalDisplayDate: json["OriginalDisplayDate"],
    views: json["Views"],
    categoryId: json["CategoryId"],
    categoryUrl: json["CategoryURL"],
    categoryName: json["CategoryName"],
    categoryDisplayName: json["CategoryDisplayName"],
    rootCategoryId: json["RootCategoryId"],
    rootCategoryName: json["RootCategoryName"],
    rootCategoryDisplayName: json["RootCategoryDisplayName"],
    authorImage: json["AuthorImage"],
    nextPostId: json["NextPostID"],
    nextPostDisplayDate: json["NextPostDisplayDate"],
  );

  Map<String, dynamic> toJson() => {
    "PostId": postId,
    "Headline": headline,
    "Description": description,
    "PostUrl": postUrl,
    "ImageUrl": imageUrl,
    "ThumbUrl": thumbUrl,
    "ImageCaption": imageCaption,
    "DisplayDate": displayDate,
    "OriginalDisplayDate": originalDisplayDate,
    "Views": views,
    "CategoryId": categoryId,
    "CategoryURL": categoryUrl,
    "CategoryName": categoryName,
    "CategoryDisplayName": categoryDisplayName,
    "RootCategoryId": rootCategoryId,
    "RootCategoryName": rootCategoryName,
    "RootCategoryDisplayName": rootCategoryDisplayName,
    "AuthorImage": authorImage,
    "NextPostID": nextPostId,
    "NextPostDisplayDate": nextPostDisplayDate,
  };
}
