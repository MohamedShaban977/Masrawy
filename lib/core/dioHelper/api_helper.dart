class ApiHelper {

  static String main = 'https://www.masrawy.com/APIMSIGEMINI/GetAreaArticles?areaid=0&Ishomepage=true&includeHPLatest=true';

  static Map<String,Map<String, int>> allNews = {};

  /*
  'الرئيسية': {'الرئيسية':0},
    'اخبار': newsMain,
    'رياضة': newsSports,
    'فنون وثقافة': newsArts,
    'اقتصاد': newsEconomics,
    'التعليم': newsEducation,
    'حكايات الناس': newsPeopleTales,
    'لايف ستايل': newsLifestyle,
    'سيارات': newsCars,
    'منوعات': newsMix,
    'إسلاميات': newsIslam,
    'فيديوهات': newsVideos,
    'علوم وتكنولوجيا': newsScienceTechnology,
   */

  static int getCategoryIdByName(String categoryName){
    int id = 0;
    if(categoryName != 'الرئيسية')
      allNews.forEach((key, value) => value.forEach((key2, value2) {
        if(categoryName == key2)
          id = value2;
      }));
    return id;
  }

  static Map<String ,int> newsMain = {
    'أخبار الرئيسية': 25, // =23
    'اخبار مصر': 35,// =23
    'اخبار البنوك': 847,// =23
    'اخبار العرب والعالم': 202,// =23
    'حوادث': 205,// =23
    'اخبار المحافظات': 204,// =23
    'مقالات': 211,// =23
    'فيديوهات اخبارية':121,// =23
  };

  static Map<String ,int> newsEconomics = {'اقتصاد': 206};

  static Map<String,int> newsSports = {
    'رياضة الرئيسية':27, // =23
    'رياضة محلية': 577,// =23
    'عربية وعالمية': 579,// =23
    'مقالات': 227,// =23
    'صور': 467,// =23
    'فيديوهات':568,// =23
    'اخرى': 578// =23
  };

  static Map<String,int> newsEducation = {
    'التعليم الرئيسية': 832,// =23
    'جامعات ومدارس': 833,// =23
    'التنسيق': 834,// =23
    'شئون الطلاب': 837,// =23
    'الازهر': 885// =23
  };

  static Map<String, int> newsArts = {
    'فنون وثقافة الرئيسية': 210,// =54
    'فيديوهات فنية': 122,// =54
    'موسيقى':255,// =54
    'مسرح وتليفزيون': 235,// =54
    'سينما': 254,// =54// =54
    'زوم': 582,// =54
    'أجنبى': 583,// =54
  };

  static Map<String, int> newsCars = {
    'السيارات الرئيسية': 373,// =40
    'اخبار السيارات': 375,// =40
    'ألبوم صور': 378,// =40
    'صور وفيدوهات': 379,// =40
    'سباقات': 376,// =40
    'نصائح': 598,// =40
  };

  static Map<String, int> newsLifestyle = {
    'لايف ستايل الرئيسية': 217,
    'علاقات': 223,
    'الموضه والجمال': 218,
    'المطبخ': 221,
    'نصائح طبية': 219,
    'الحمل والامومة': 222,
    'الرجل': 402,
    'سفروسياحة': 603
  };

  static Map<String, int> newsIslam = {
    'اسلاميات متنوع': 262,
    'فتاوى': 61,
    'سيرة': 51,
    'قران': 56,
    'قصص': 446,
    'فيديوهات': 215,
    'اخرى': 445,
  };

  static Map<String, int> newsVideos = {
    'مصراوى تى فى': 721,
    'فيديوهات': 723,
    'صور وفيديوهات وصفات': 214,
  };

  static Map<String, int> newsPeopleTales = {'حكايات الناس': 208};

  static Map<String, int> newsMix = {'منوعات': 765};

  static Map<String, int> newsScienceTechnology = {'علوم وتكنولوجيا': 382};
}

/*
&pageIndex=1&pageSize=100
*/