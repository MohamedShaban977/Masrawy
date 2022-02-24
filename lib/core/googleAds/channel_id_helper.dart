import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'ad_model.dart';

class GoogleAdChannelIdHelper {
  static String
      news = 'news', //25
      autos = 'autos', //373
      arts = 'arts', //210
      islameyat = 'islameyat', //262
      howa_w_hya = 'howa_w_hya',//217
      ramadan = 'ramadan',
      sports = 'sports', //27
      ROS = 'ROS';
  static const int leaderBoardTypeId1 = 2;
  static const int leaderBoardTypeId2 = 3;

  static const int interstitialTypeId = 25;

  static const int showCase1TypeId = 5; //
  static const int showCase2TypeId = 6; //

  static const int sponsorTypeId = 4;

  static Map<String, int> mapCategoriesToChannel = {
    news: 23,
    howa_w_hya:23,
    sports:23 ,//news   id news = 25 RootCategoryId id news ,
    autos: 40, //Autos
    arts: 54, //Arts
    islameyat: 34, //Islameyat
    ramadan: 92, //Ramadan
    ROS: 67,

  };

  // String textCode;
  AdModel res;
  Future<AdModel> getAdUnit(int channelId, int adType) async {
    // if (!mapCategoriesToChannel.containsKey(categoryId)) return null;

    // int channelId = mapCategoriesToChannel[categoryId];

    final url =
        'http://api.ams.gemini.media/api/AdCode/getAdCode?channelId=$channelId&typeId=$adType&applicationId=3';
    final response = await get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      res = AdModel.fromJson(body);
      // print(res.codeText);
      // print('response :  ' + response.body);

      return res;
    }
    // print('response :  ' + response.body);
  }
}

///
/// RootCategoryId id news = 25 ,

/// "RootCategoryId" id sports   : 27 ,
