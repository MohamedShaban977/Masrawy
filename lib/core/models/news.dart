// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.success,
    this.exception,
    this.result,
  });

  bool success;
  dynamic exception;
  List<Result> result;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    success: json["Success"],
    exception: json["Exception"],
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
  );

  factory NewsModel.fromHive(Map<dynamic, dynamic> json) => NewsModel(
    success: json["Success"],
    exception: json["Exception"],
    result: List<Result>.from(json["Result"].map((x) => Result.fromHive(x))),
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
    this.rootCategoryUrl,
    this.rootCategoryName,
    this.rootCategoryDisplayName,
  });

  int postId;
  String headline;
  String description;
  dynamic postUrl;
  String imageUrl;
  dynamic thumbUrl;
  String imageCaption;
  dynamic imageClass;
  dynamic body;
  String displayDate;
  String originalDisplayDate;
  int views;
  int categoryId;
  dynamic categoryUrl;
  String categoryName;
  dynamic categoryDisplayName;
  List<dynamic> postAlbum;
  List<dynamic> keywordsList;
  dynamic author;
  int rootCategoryId;
  dynamic rootCategoryUrl;
  String rootCategoryName;
  String rootCategoryDisplayName;
  String authorId;
  dynamic authorUrl;
  dynamic authorImage;
  dynamic authorName;
  int nextPostId;
  dynamic nextHeadLine;
  String nextPostDisplayDate;
  dynamic relatedArticles;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    postId: json["PostId"],
    headline: json["Headline"],
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
    rootCategoryUrl: json["RootCategoryURL"],
    rootCategoryName: json["RootCategoryName"],
    rootCategoryDisplayName: json["RootCategoryDisplayName"],
  );

  factory Result.fromHive(Map<dynamic, dynamic> json) => Result(
    postId: json["PostId"],
    headline: json["Headline"],
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
    rootCategoryUrl: json["RootCategoryURL"],
    rootCategoryName: json["RootCategoryName"],
    rootCategoryDisplayName: json["RootCategoryDisplayName"],
  );

  Map<String, dynamic> toJson() => {
    "PostId": postId,
    "Headline": headline,
    "Description": description,
    "PostUrl": postUrl,
    "ImageUrl": imageUrl,
    "ThumbUrl": thumbUrl,
    "ImageCaption": imageCaption,
    "ImageClass": imageClass,
    "Body": body,
    "DisplayDate": displayDate,
    "OriginalDisplayDate": originalDisplayDate,
    "Views": views,
    "CategoryId": categoryId,
    "CategoryURL": categoryUrl,
    "CategoryName": categoryName,
    "CategoryDisplayName": categoryDisplayName,
    "Author": author,
    "RootCategoryId": rootCategoryId,
    "RootCategoryURL": rootCategoryUrl,
    "RootCategoryName": rootCategoryName,
    "RootCategoryDisplayName": rootCategoryDisplayName,
    "AuthorId": authorId,
    "AuthorUrl": authorUrl,
    "AuthorImage": authorImage,
    "AuthorName": authorName,
    "NextPostID": nextPostId,
    "NextHeadLine": nextHeadLine,
    "NextPostDisplayDate": nextPostDisplayDate,
    "RelatedArticles": relatedArticles,
  };
}