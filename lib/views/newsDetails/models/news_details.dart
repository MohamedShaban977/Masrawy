// To parse this JSON data, do
//
//     final newsDetailsModel = newsDetailsModelFromJson(jsonString);

import 'dart:convert';

NewsDetailsModel newsDetailsModelFromJson(String str) => NewsDetailsModel.fromJson(json.decode(str));

String newsDetailsModelToJson(NewsDetailsModel data) => json.encode(data.toJson());

class NewsDetailsModel {
  NewsDetailsModel({
    this.success,
    this.exception,
    this.result,
  });

  bool success;
  dynamic exception;
  Result result;

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) => NewsDetailsModel(
    success: json["Success"],
    exception: json["Exception"],
    result: Result.fromJson(json["Result"]),
  );

  factory NewsDetailsModel.fromHive(Map<dynamic, dynamic> json) => NewsDetailsModel(
    success: json["Success"],
    exception: json["Exception"],
    result: Result.fromHive(json["Result"]),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Exception": exception,
    "Result": result.toJson(),
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
    this.body,
    this.displayDate,
    this.views,
    this.categoryId,
    this.categoryName,
    this.categoryDisplayName,
    this.postAlbum,
    this.keywordsList,
    this.rootCategoryName,
    this.rootCategoryDisplayName,
    this.nextPostId,
    this.nextHeadLine,
    this.relatedArticles,
    this.categoryUrl,
    this.rootCategoryId,
    this.rootCategoryUrl,
    this.nextPostDisplayDate,
  });

  int postId;
  String headline;
  String description;
  String postUrl;
  String imageUrl;
  dynamic thumbUrl;
  String imageCaption;
  String body;
  String displayDate;
  int views;
  int categoryId;
  String categoryName;
  dynamic categoryDisplayName;
  List<PostAlbum> postAlbum;
  List<KeywordsList> keywordsList;
  String rootCategoryName;
  String rootCategoryDisplayName;
  int nextPostId;
  String nextHeadLine;
  List<Result> relatedArticles;
  dynamic categoryUrl;
  int rootCategoryId;
  dynamic rootCategoryUrl;
  String nextPostDisplayDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    postId: json["PostId"],
    headline: json["Headline"],
    description: json["Description"],
    postUrl: json["PostUrl"] == null ? null : json["PostUrl"],
    imageUrl: json["ImageUrl"],
    thumbUrl: json["ThumbUrl"],
    imageCaption: json["ImageCaption"],
    body: json["Body"] == null ? null : json["Body"],
    displayDate: json["DisplayDate"],
    views: json["Views"],
    categoryId: json["CategoryId"],
    categoryName: json["CategoryName"],
    categoryDisplayName: json["CategoryDisplayName"],
    postAlbum: json["PostAlbum"] == null ? null : List<PostAlbum>.from(json["PostAlbum"].map((x) => PostAlbum.fromJson(x))),
    keywordsList: List<KeywordsList>.from(json["KeywordsList"].map((x) => KeywordsList.fromJson(x))),
    rootCategoryName: json["RootCategoryName"],
    rootCategoryDisplayName: json["RootCategoryDisplayName"],
    nextPostId: json["NextPostID"],
    nextHeadLine: json["NextHeadLine"] == null ? null : json["NextHeadLine"],
    relatedArticles: json["RelatedArticles"] == null ? null : List<Result>.from(json["RelatedArticles"].map((x) => Result.fromJson(x))),
    categoryUrl: json["CategoryURL"],
    rootCategoryId: json["RootCategoryId"] == null ? null : json["RootCategoryId"],
    rootCategoryUrl: json["RootCategoryURL"],
    nextPostDisplayDate: json["NextPostDisplayDate"] == null ? null : json["NextPostDisplayDate"],
  );

  factory Result.fromHive(Map<dynamic, dynamic> json) => Result(
    postId: json["PostId"],
    headline: json["Headline"],
    description: json["Description"],
    postUrl: json["PostUrl"] == null ? null : json["PostUrl"],
    imageUrl: json["ImageUrl"],
    thumbUrl: json["ThumbUrl"],
    imageCaption: json["ImageCaption"],
    body: json["Body"] == null ? null : json["Body"],
    displayDate: json["DisplayDate"],
    views: json["Views"],
    categoryId: json["CategoryId"],
    categoryName: json["CategoryName"],
    categoryDisplayName: json["CategoryDisplayName"],
    postAlbum: json["PostAlbum"] == null ? null : List<PostAlbum>.from(json["PostAlbum"].map((x) => PostAlbum.fromHive(x))),
    keywordsList: List<KeywordsList>.from(json["KeywordsList"].map((x) => KeywordsList.fromHive(x))),
    rootCategoryName: json["RootCategoryName"],
    rootCategoryDisplayName: json["RootCategoryDisplayName"],
    nextPostId: json["NextPostID"],
    nextHeadLine: json["NextHeadLine"] == null ? null : json["NextHeadLine"],
    relatedArticles: json["RelatedArticles"] == null ? null : List<Result>.from(json["RelatedArticles"].map((x) => Result.fromHive(x))),
    categoryUrl: json["CategoryURL"],
    rootCategoryId: json["RootCategoryId"] == null ? null : json["RootCategoryId"],
    rootCategoryUrl: json["RootCategoryURL"],
    nextPostDisplayDate: json["NextPostDisplayDate"] == null ? null : json["NextPostDisplayDate"],
  );

  Map<String, dynamic> toJson() => {
    "PostId": postId,
    "Headline": headline,
    "Description": description,
    "PostUrl": postUrl == null ? null : postUrl,
    "ImageUrl": imageUrl,
    "ThumbUrl": thumbUrl,
    "ImageCaption": imageCaption,
    "Body": body == null ? null : body,
    "DisplayDate": displayDate,
    "Views": views,
    "CategoryId": categoryId,
    "CategoryName": categoryName,
    "CategoryDisplayName": categoryDisplayName,
    "PostAlbum": postAlbum == null ? null : List<dynamic>.from(postAlbum.map((x) => x.toJson())),
    "KeywordsList": List<dynamic>.from(keywordsList.map((x) => x.toJson())),
    "RootCategoryName": rootCategoryName,
    "RootCategoryDisplayName": rootCategoryDisplayName,
    "NextPostID": nextPostId,
    "NextHeadLine": nextHeadLine == null ? null : nextHeadLine,
    "RelatedArticles": relatedArticles == null ? null : List<dynamic>.from(relatedArticles.map((x) => x.toJson())),
    "CategoryURL": categoryUrl,
    "RootCategoryId": rootCategoryId == null ? null : rootCategoryId,
    "RootCategoryURL": rootCategoryUrl,
    "NextPostDisplayDate": nextPostDisplayDate == null ? null : nextPostDisplayDate,
  };
}

class KeywordsList {
  KeywordsList({
    this.keywordId,
    this.name,
    this.postId,
  });

  int keywordId;
  String name;
  int postId;

  factory KeywordsList.fromJson(Map<String, dynamic> json) => KeywordsList(
    keywordId: json["KeywordID"],
    name: json["Name"],
    postId: json["PostID"],
  );

  factory KeywordsList.fromHive(Map<dynamic, dynamic> json) => KeywordsList(
    keywordId: json["KeywordID"],
    name: json["Name"],
    postId: json["PostID"],
  );

  Map<String, dynamic> toJson() => {
    "KeywordID": keywordId,
    "Name": name,
    "PostID": postId,
  };
}

class PostAlbum {
  PostAlbum({
    this.albumImages,
    this.coverImageName,
    this.description,
    this.id,
    this.name,
  });

  List<AlbumImage> albumImages;
  String coverImageName;
  String description;
  int id;
  String name;

  factory PostAlbum.fromJson(Map<String, dynamic> json) => PostAlbum(
    albumImages: List<AlbumImage>.from(json["AlbumImages"].map((x) => AlbumImage.fromJson(x))),
    coverImageName: json["CoverImageName"],
    description: json["Description"],
    id: json["ID"],
    name: json["Name"],
  );

  factory PostAlbum.fromHive(Map<dynamic, dynamic> json) => PostAlbum(
    albumImages: List<AlbumImage>.from(json["AlbumImages"].map((x) => AlbumImage.fromHive(x))),
    coverImageName: json["CoverImageName"],
    description: json["Description"],
    id: json["ID"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "AlbumImages": List<dynamic>.from(albumImages.map((x) => x.toJson())),
    "CoverImageName": coverImageName,
    "Description": description,
    "ID": id,
    "Name": name,
  };
}

class AlbumImage {
  AlbumImage({
    this.type,
    this.title,
    this.isDefault,
    this.imageUrl,
    this.id,
    this.embed,
  });

  int type;
  String title;
  bool isDefault;
  String imageUrl;
  int id;
  dynamic embed;

  factory AlbumImage.fromJson(Map<String, dynamic> json) => AlbumImage(
    type: json["Type"],
    title: json["Title"],
    isDefault: json["IsDefault"],
    imageUrl: json["ImageUrl"],
    id: json["ID"],
    embed: json["Embed"],
  );

  factory AlbumImage.fromHive(Map<dynamic, dynamic> json) => AlbumImage(
    type: json["Type"],
    title: json["Title"],
    isDefault: json["IsDefault"],
    imageUrl: json["ImageUrl"],
    id: json["ID"],
    embed: json["Embed"],
  );

  Map<String, dynamic> toJson() => {
    "Type": type,
    "Title": title,
    "IsDefault": isDefault,
    "ImageUrl": imageUrl,
    "ID": id,
    "Embed": embed,
  };
}
