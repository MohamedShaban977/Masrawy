import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/views/search/models/search_results.dart';
import 'package:masrawy/views/search/states/controller.dart';

import '../../../constants.dart';

class SearchController extends Cubit<SearchStates>{
  SearchController([String keyword]) : super(SearchInit()){
    searchController = TextEditingController(text: keyword);
    if(keyword != null) search();
  }

  static SearchController get(context)=> BlocProvider.of(context);

  SearchResultModel searchResultModel;
  int pageIndex = 1;
  TextEditingController searchController;
  ScrollController scrollController = ScrollController();

  void scrollListener(){
    scrollController.addListener(() async{
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
        emit(SearchMoreLoading());
        pageIndex++;
        await getMoreNews();
        emit(SearchInit());
      }
    });
  }

  void search()async{
    if(searchController.text.isEmpty)
      return;
    emit(SearchLoading());
    searchResultModel = null;
    final url = 'https://www.masrawy.com/APIMSIGEMINI/Search?categoryid=0&pageIndex=1&searchKey=${searchController.text}&pagesize=30&getAccurateRes=false';
    final response = await Dio().get(url);
    try{
      final data = response.data as Map;
      if(data['Result'] != null)
        searchResultModel = SearchResultModel.fromJson(data);
    }catch(e){
      showDefaultErrorMessage();
    }
    emit(SearchInit());
  }

  Future<void> getMoreNews()async{
    final url = 'https://www.masrawy.com/APIMSIGEMINI/Search?categoryid=0&pageIndex=$pageIndex&searchKey=${searchController.text}&pagesize=30&getAccurateRes=false';
    final response = await Dio().get(url);
    try{
      final data = response.data as Map;
      final moreNewsModel = SearchResultModel.fromJson(data);
      searchResultModel.result.addAll(moreNewsModel.result);
    }catch(e){
      showDefaultErrorMessage();
    }
  }
}