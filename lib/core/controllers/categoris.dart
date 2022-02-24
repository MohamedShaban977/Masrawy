import 'package:dio/dio.dart';
import 'package:masrawy/core/models/categories.dart';
import 'package:masrawy/widgets/toast.dart';

class CategoriesController {
  //25

  static Dio _dio = Dio();
  static String _url = 'https://www.masrawy.com/APIMSIGEMINI/MenuNav';
  static CategoriesModel categoriesModel;

  static Future<void> get()async{
    try{
      final response = await _dio.get(_url);
      if(response.statusCode ==200){
      categoriesModel = CategoriesModel.fromJson(response.data);
      categoriesModel.result.forEach((mainCategory) async {
        Map<String,int> subCategories = {};
        if(mainCategory.childrenList.isNotEmpty) {
         mainCategory.childrenList.forEach((subCategory)=> subCategories[subCategory.name] = subCategory.categoryId);
        }
        else
             subCategories[mainCategory.name] =mainCategory.categoryId;
      });}
      else return;
    }catch(e){
      print(e.toString());
      // showToast(e.toString());
      if(categoriesModel==null){
        await get();
        return;
      }

    }
  }

}