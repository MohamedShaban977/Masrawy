import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/googleAds/interstitial.dart';
import 'package:masrawy/core/hiveHelper/hive_helper.dart';
import 'package:masrawy/views/newsDetails/cubits/sponsor_ad.dart';
import 'package:masrawy/views/newsDetails/models/news_details.dart';
import 'package:masrawy/views/newsDetails/states/controller.dart';

import '../../../constants.dart';

class NewsDetailsController extends Cubit<NewsDetailsStates>{
  NewsDetailsController({this.newsId}) : super(NewsDetailsInit());

  static NewsDetailsController get(context)=> BlocProvider.of(context);

  ScrollController scrollController = ScrollController();
  NewsDetailsModel newsDetailsModel;
  int newsId;

  void scrollListener(BuildContext context){
    scrollController.addListener(() async{
      if(scrollController.position.pixels <= 50)
        SponsorAdCubit.get(context).rebuild();
    });
  }

  Future<void> getDetails()async{
    emit(NewsDetailsLoading());
    newsDetailsModel = await HiveHelper.getNewsDetailsById(newsId);
    emit((newsDetailsModel == null ? NewsDetailsLoading() : NewsDetailsInit()));
    final url = 'https://www.masrawy.com/APIMSIGEMINI/GetArticleDetailsById?PostId=$newsId&Date=04/05/2021';
    try{
      final response = await Dio().get(url);
      final data = response.data as Map;
      newsDetailsModel = NewsDetailsModel.fromJson(data);
      await HiveHelper.cacheNewsDetailsById(newsId, newsDetailsModel);
      // final adUnitId = await GoogleAdChannelIdHelper.getAdUnit(newsDetailsModel.result.categoryId, GoogleAdChannelIdHelper.interstitialTypeId);
      // InterstitialAd(adUnitId)..showAd();
    }catch(e){
      showDefaultErrorMessage();
      emit(NewsDetailsError());
      return;
    }
    emit(NewsDetailsInit());
  }

}