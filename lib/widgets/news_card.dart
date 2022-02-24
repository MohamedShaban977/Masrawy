import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/models/categories.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/views/home/view.dart';
import 'package:masrawy/views/newsDetails/view.dart';
import 'package:masrawy/views/newsTemplate/view.dart';

import 'news_list.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String categoryName;
  final String date;
  final int newsId;
  final int categoryId;
  final int rootCategoryId;
  final String rootCategoryName;

  // TabController tabController;

  NewsCard(
      {this.image,
      this.title,
      this.categoryName,
      this.date,
      this.newsId,
      this.categoryId,
      this.rootCategoryId,
      this.rootCategoryName});
  @override
  Widget build(BuildContext context) {
    // var map;
    // var reversed = Map.fromEntries(GoogleAdChannelIdHelper
    //     .mapCategoriesToChannel.entries
    //     .map((e) => MapEntry(e.key, e.value)));
    // for (var k in reversed.keys) {
    //   if (rootCategoryName == k.toString()) {
    //     print(k);
    //     map = GoogleAdChannelIdHelper.mapCategoriesToChannel[rootCategoryName];
    //     print(GoogleAdChannelIdHelper.mapCategoriesToChannel[rootCategoryName]);
    //   }
    // }
    // print(map);
    return GestureDetector(
      onTap: () => MagicRouter.navigateTo(NewsDetailsView(newsId)),
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage.assetNetwork(
                placeholder: getAsset('logoo.png'),
                image: image,
                width: image != null
                    ? constraints.maxWidth
                    : constraints.maxWidth * 0.1,
                height: sizeFromHeight(3),
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  title,
                  style: getTextTheme.subtitle2,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        // print('adfasdfasd');

                        CategoriesTabBarController.get(context)
                            .navigateToTabBySubCategory(categoryId);
                      },
                      child: Text(
                        categoryName ?? '',
                        style: TextStyle(
                            color: rootCategoryName ==
                                    GoogleAdChannelIdHelper.news
                                ? Color(0xffE63B34)
                                : rootCategoryName ==
                                        GoogleAdChannelIdHelper.arts
                                    ? Color(0xffFBAA19)
                                    : rootCategoryName ==
                                            GoogleAdChannelIdHelper.autos
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
                                                    ? Color(0xff43A047)
                                                    : Color(0xff1D1D1D),
                            fontSize: 12),
                      )),
                  // Text(
                  //   rootCategoryName + '  ' + rootCategoryId.toString(),
                  //   style: TextStyle(fontSize: 18),
                  // ),
                  Text(date),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
