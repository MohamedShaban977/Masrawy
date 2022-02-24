import 'package:flutter/material.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/models/categories.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/views/newsDetails/view.dart';

import 'news_list.dart';

class NewsTile extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String categoryName;
  final int categoryId;
  final int newsId;
  final String rootCategoryName;
  final bool isSearch;
  NewsTile(
      {this.image,
      this.title,
      this.date,
      this.categoryName,
      this.newsId,
      this.categoryId,
      this.rootCategoryName,
      this.isSearch = false});

  List<Result> tabs;
  // Result _result = Result();
  // TabController tabController;
  Result mainCategory;
  List<Result> subCategories;
  // CategoriesModel _categoriesModel = CategoriesModel();
  // var mainCategories = CategoriesController.categoriesModel.result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MagicRouter.navigateTo(NewsDetailsView(newsId)),
      child: LayoutBuilder(builder: (context, con) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        final heightLocal = con.maxHeight;
        final widthLocal = con.maxWidth;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
            // height: sizeFromHeight(3),
            height: height * 0.15,
            alignment: Alignment.topRight,
            // clipBehavior: Clip.antiAlias,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.white12,
            //     width: 1,
            //   ),
            //   // borderRadius: BorderRadius.circular(20),
            //   // color: Colors.deepOrangeAccent
            // ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 0,
                      child: FadeInImage.assetNetwork(
                        placeholder: getAsset('logoo.png'),
                        image: image,
                        fit: BoxFit.fill,
                        height: height * 0.14,
                        width: width * 0.4,
                      )),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    // flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.005),
                          child: Text(
                            title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  // print('sdgsdgsdgsdgsgsdg');
                                  if (isSearch) {
                                    await Navigator.pop(context);

                                    CategoriesTabBarController.get(context)
                                        .navigateToTabBySubCategory(categoryId);
                                  } else {
                                    CategoriesTabBarController.get(context)
                                        .navigateToTabBySubCategory(categoryId);
                                  }
                                },
                                child: Text(
                                  categoryName,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: rootCategoryName ==
                                              GoogleAdChannelIdHelper.news
                                          ? Color(0xffE63B34)
                                          : rootCategoryName ==
                                                  GoogleAdChannelIdHelper.arts
                                              ? Color(0xffFBAA19)
                                              : rootCategoryName ==
                                                      GoogleAdChannelIdHelper
                                                          .autos
                                                  ? Color(0xff1A237E)
                                                  : rootCategoryName ==
                                                          GoogleAdChannelIdHelper
                                                              .howa_w_hya
                                                      ? Color(0xff7B1FA2)
                                                      : rootCategoryName ==
                                                              GoogleAdChannelIdHelper
                                                                  .islameyat
                                                          ? Color(0xff1C87C9)
                                                          : rootCategoryName ==
                                                                  GoogleAdChannelIdHelper
                                                                      .sports
                                                              ? Color(
                                                                  0xff43A047)
                                                              : Color(
                                                                  0xffE63B34),
                                      fontSize: 16),
                                )),
                            SizedBox(height: 5),
                            Text(
                              date,
                              maxLines: 1,
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void getCategory({BuildContext context, int index = 0}) {
    print('$categoryId');

    CategoriesTabBarController.get(context).navigateTo(
        CategoriesController.categoriesModel.result.indexOf(mainCategory),
        index);
  }
}
/*
Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: FadeInImage.assetNetwork(placeholder: getAsset('loading.png'), image: image)),
                SizedBox(width: 10,),
                Expanded(flex: 2,child: Text(title,maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(categoryName ?? '  ',maxLines: 1,style: TextStyle(color: Colors.red,fontSize: 12),),
                Text(date,maxLines: 1,textAlign: TextAlign.end,style: TextStyle(fontSize: 11,color: Colors.black87),),
              ],
            ),
            Divider(),
          ],
        )
 */

/*


 */
