import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/core/router/router.dart';

import 'categoris.dart';

class CategoriesTabBarController extends Cubit<CategoriesTabBarStates>{
  CategoriesTabBarController() : super(CategoriesTabBarInit());

  static CategoriesTabBarController get(context)=> BlocProvider.of(context);

  TabController mainTabController;
  TabController subTabController;
  int index = 0;

  void navigateTo(int mainTabIndex,int subTabIndex)async{
    MagicRouter.pop();
    mainTabController.animateTo(mainTabIndex);
    await Future.delayed(Duration(milliseconds: 100));
    subTabController.animateTo(subTabIndex);
  }

  void navigateToTabBySubCategory(int categoryId)async{
    int mainCategoryIndex;
    int subCategoryIndex;
    CategoriesController.categoriesModel.result.forEach((element) {
      final index = CategoriesController.categoriesModel.result.indexOf(element);
      if(element.childrenList.isNotEmpty)
        element.childrenList.forEach((childElement) {
          final childIndex = element.childrenList.indexOf(childElement);
          if(categoryId == childElement.categoryId){
            mainCategoryIndex = index;
            subCategoryIndex = childIndex;
          }
        });
      else if (element.childrenList.isNotEmpty && element.categoryId == categoryId){
        mainCategoryIndex = index;
      }
    });
    try{
      mainTabController.animateTo(mainCategoryIndex);
      await Future.delayed(Duration(milliseconds: 100));
      subTabController.animateTo(subCategoryIndex);
    }catch(e){}
  }

  void navigateToLogoHomeScreen(int categoryId)async{
    int mainCategoryIndex;
    int subCategoryIndex;
    CategoriesController.categoriesModel.result.forEach((element) {
      final index = CategoriesController.categoriesModel.result.indexOf(element);
      if(element.childrenList.isNotEmpty)
        element.childrenList.forEach((childElement) {
          final childIndex = element.childrenList.indexOf(childElement);
          if(categoryId == childElement.id){
            mainCategoryIndex = index;
            subCategoryIndex = childIndex;
          }
        });
      else if (element.childrenList.isNotEmpty && element.id == categoryId){
        mainCategoryIndex = index;
      }
    });
    try{
      mainTabController.animateTo(mainCategoryIndex);
      await Future.delayed(Duration(milliseconds: 100));
      subTabController.animateTo(subCategoryIndex);
    }catch(e){}
  }
}

abstract class CategoriesTabBarStates {}

class CategoriesTabBarInit extends CategoriesTabBarStates {}