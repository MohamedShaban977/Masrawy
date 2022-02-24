import 'package:hive/hive.dart';
import 'package:masrawy/core/models/news.dart';
import 'package:masrawy/views/newsDetails/models/news_details.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {

  static Box<dynamic> newsDB;
  static Box<dynamic> newsDetailsDB;
  static const _NEWS_DB = 'news';
  static const _NEWS_DETAILS_DB = 'news';

  static void init()async{
    var appDirectory = await getApplicationDocumentsDirectory();
    Hive..init(appDirectory.path);
    newsDB = await Hive.openBox(_NEWS_DB);
    newsDetailsDB = await Hive.openBox(_NEWS_DETAILS_DB);
  }

  static Future<NewsModel> getNewsById(int id)async{
    NewsModel newsModel;
    if(newsDB.containsKey(id)){
      final jsonNewsModel = await newsDB.get(id);
      newsModel = NewsModel.fromHive(jsonNewsModel);
    }
    return newsModel;
  }

  static Future<void> cacheNewsById(int id,NewsModel newsModel)async{
    final jsonNewsModel = newsModel.toJson();
    await newsDB.put(id, jsonNewsModel);
  }

  static Future<void> cacheNewsDetailsById(int id,NewsDetailsModel value)async{
    final jsonNewsDetailsModel = value.toJson();
    await newsDetailsDB.put(id, jsonNewsDetailsModel);
  }

  static Future<NewsDetailsModel> getNewsDetailsById(int id)async{
    NewsDetailsModel newsDetailsModel;
    if(newsDetailsDB.containsKey(id)){
      final jsonNewsModel = await newsDetailsDB.get(id);
      newsDetailsModel = NewsDetailsModel.fromHive(jsonNewsModel);
    }
    return newsDetailsModel;
  }

  // void doSomething()async{
  //   await box.put('key', 'value');
  //   print(box.get('key'));
  //   var box2 = await Hive.openBox('test2');
  //   box2.put('key', 'value2');
  //   print(box2.get('key'));
  // }

}