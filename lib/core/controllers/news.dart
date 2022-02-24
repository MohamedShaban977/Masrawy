import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/core/dioHelper/api_helper.dart';

import 'package:masrawy/core/hiveHelper/hive_helper.dart';
import 'package:masrawy/core/models/news.dart';
import '../../constants.dart';

class NewsController extends Cubit<NewsStates>{
  NewsController({this.categoryId}) : super(NewsInit());

  static NewsController get (context)=> BlocProvider.of(context);


  NewsModel newsModel;
  int categoryId;
  int pageIndex = 1;
  ScrollController scrollController = ScrollController();

  bool adHasShow = false;

  void paginationListener(){
    if(categoryId == 0) return;
    scrollController.addListener(() async{
      if(scrollController.position.pixels <= 50)
        emit(NewsInit());
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
        emit(NewsMoreLoading());
        pageIndex++;
        await getMoreNews();
        emit(NewsInit());
      }
    });
  }

  Future<void> getNewsById()async{
    emit(NewsPageLoading());
    newsModel = await HiveHelper.getNewsById(categoryId);
    emit((newsModel == null ? NewsPageLoading() : NewsInit()));
    final url = (categoryId == 0 ? ApiHelper.main : 'https://www.masrawy.com/APIMSIGEMINI/GetArticleListByCategory?CategoryID=$categoryId&pageIndex=$pageIndex&pageSize=30');
    final response = await Dio().get(url);
    try{
      final data = response.data as Map;
      newsModel = NewsModel.fromJson(data);
      await HiveHelper.cacheNewsById(categoryId, newsModel);
      // final adUnitId = await GoogleAdChannelIdHelper.getAdUnit(categoryId, GoogleAdChannelIdHelper.interstitialTypeId);
      // InterstitialAd(adUnitId)..showAd();
    }catch(e){
      // showDefaultErrorMessage();
    }
    emit(NewsInit());
  }

  Future<void> getMoreNews()async{
    final url = (categoryId == 0 ? ApiHelper.main : 'https://www.masrawy.com/APIMSIGEMINI/GetArticleListByCategory?CategoryID=$categoryId&pageIndex=$pageIndex&pageSize=30');
    final response = await Dio().get(url);
    try{
      final data = response.data as Map;
      final moreNewsModel = NewsModel.fromJson(data);
      newsModel.result.addAll(moreNewsModel.result);
      await HiveHelper.cacheNewsById(categoryId, newsModel);
    }catch(e){
      showDefaultErrorMessage();
    }
  }


}

abstract class NewsStates {}

class NewsInit extends NewsStates {}

class NewsPageLoading extends NewsStates {}

class NewsMoreLoading extends NewsStates {}

/*
ScrollController mainController = ScrollController();

  // اخبار
  ScrollController newsMainController = ScrollController();
  ScrollController newsEgyptController = ScrollController();
  ScrollController newsArabWorldController = ScrollController();
  ScrollController newsAccidentController = ScrollController();
  ScrollController newsGovController = ScrollController();
  ScrollController newsEduController = ScrollController();
  ScrollController newsArticlesController = ScrollController();
  ScrollController newsVideosController = ScrollController();

  // رياضه

  ScrollController sportsMainController = ScrollController();
  ScrollController sportsLocalController = ScrollController();
  ScrollController sportsArabWorldController = ScrollController();
  ScrollController sportsArticlesController = ScrollController();
  ScrollController sportsPhotosController = ScrollController();
  ScrollController sportsVideosController = ScrollController();
  ScrollController sportsOtherController = ScrollController();

  // فنون و ثقافه

  ScrollController artsMainController = ScrollController();
  ScrollController artsMusicController = ScrollController();
  ScrollController artsVideosController = ScrollController();
  ScrollController artsTheaterController = ScrollController();
  ScrollController artsCinemaController = ScrollController();
  ScrollController artsZoomController = ScrollController();
  ScrollController artsForeignController = ScrollController();

  // اقتصاد

  ScrollController economicsController = ScrollController();

  // حكايات الناس

  ScrollController peopleTalesController = ScrollController();

  // لايف ستايل

  ScrollController lifeStyleMainController = ScrollController();
  ScrollController lifeStyleRelationsController = ScrollController();
  ScrollController lifeStyleFashionController = ScrollController();
  ScrollController lifeStyleKitchenController = ScrollController();
  ScrollController lifeStyleAdvicesController = ScrollController();
  ScrollController lifeStyleMothersController = ScrollController();
  ScrollController lifeStyleManController = ScrollController();
  ScrollController lifeStyleTravelsController = ScrollController();

  // سيارات

  ScrollController carsMainController = ScrollController();
  ScrollController carsNewsController = ScrollController();
  ScrollController carsPhotosController = ScrollController();
  ScrollController carsVideosController = ScrollController();
  ScrollController carsRacesController = ScrollController();
  ScrollController carsAdvicesController = ScrollController();

  // منوعات

  ScrollController mixController = ScrollController();

  // اسلاميات

  ScrollController islamMainController = ScrollController();
  ScrollController islamFatwasController = ScrollController();
  ScrollController islamPropheticController = ScrollController();
  ScrollController islamQuranController = ScrollController();
  ScrollController islamOtherController = ScrollController();
  ScrollController islamStoriesController = ScrollController();
  ScrollController islamVideosController = ScrollController();
 */