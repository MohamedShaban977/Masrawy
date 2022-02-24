import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_ad_manager/interstitial_ad.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/core/controllers/news.dart';
import 'package:masrawy/core/googleAds/ad_model.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/googleAds/interstitial.dart';
import 'package:masrawy/core/googleAds/leaderboard_1.dart';
import 'package:masrawy/core/googleAds/show_case_1.dart';
import 'package:masrawy/core/googleAds/show_case_2.dart';
import 'package:masrawy/core/googleAds/sponsor.dart';
import 'package:masrawy/widgets/loading_indicator.dart';
import 'package:masrawy/widgets/news_card.dart';
import 'package:masrawy/widgets/news_tile.dart';
import 'package:masrawy/widgets/refresh_indicator.dart';

class NewsList extends StatefulWidget {
  final int categoryId;

  NewsList(this.categoryId);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  GoogleAdChannelIdHelper _googleAdChannelIdHelper = GoogleAdChannelIdHelper();

  DFPInterstitialAd _interstitialAd;
  // Future<AdModel> _futureInterstitialAd;
  AdModel interstitialAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getInterstitialAd();
    interstialAd();
  }

  Future interstialAd() async {
    await getInterstitialAd();
if(interstitialAd !=null){
    _interstitialAd = DFPInterstitialAd(
      isDevelop: false,
      adUnitId: interstitialAd.codeText,
      onAdLoaded: () {
        print('interstitialAd onAdLoaded');
      },
      onAdFailedToLoad: (errorCode) {
        print('interstitialAd onAdFailedToLoad: errorCode:$errorCode');
      },
      onAdOpened: () {
        print('interstitialAd onAdOpened');
      },
      onAdClosed: () {
        print('interstitialAd onAdClosed');
        _interstitialAd.load();
      },
      onAdLeftApplication: () {
        print('interstitialAd onAdLeftApplication');
      },
    );
    _interstitialAd.load();}
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    super.dispose();
  }

  Future inter() async {
    if (interstitialAd != null){
      print('eretertertret getInterstitialAd');

        _interstitialAd.show();
    }

    return;

  }

  Future getInterstitialAd() async {
    await _googleAdChannelIdHelper.getAdUnit(
        GoogleAdChannelIdHelper.mapCategoriesToChannel[GoogleAdChannelIdHelper.news],
        GoogleAdChannelIdHelper.interstitialTypeId);
print('getInterstitialAd');
    interstitialAd = _googleAdChannelIdHelper.res;
  }

  @override
  Widget build(BuildContext context) {
    inter();

    return BlocProvider(
      create: (_) => NewsController(categoryId: widget.categoryId)
        ..getNewsById()
        ..paginationListener(),
      child: BlocBuilder<NewsController, NewsStates>(
        builder: (context, state) {
          final controller = NewsController.get(context);
          return state is NewsPageLoading
              ? LoadingIndicator()
              : Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: CustomRefreshIndicator(
                            onRefresh: controller.getNewsById,
                            child: SingleChildScrollView(
                              controller: controller.scrollController,
                              child: Column(
                                  children: List.generate(
                                controller.newsModel.result.length,
                                (index) {
                                  final news =
                                      controller.newsModel.result[index];
                                  return Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      index == 0
                                          ? Column(
                                              children: [
                                                SizedBox(height: 10),
                                                LeaderBoardAd1(
                                                  rootCategoryName:
                                                      news.rootCategoryName,
                                                ),
                                                NewsCard(
                                                  categoryName:
                                                      news.categoryDisplayName,
                                                  date: news.displayDate,
                                                  title: news.headline,
                                                  image: news.imageUrl,
                                                  newsId: news.postId,
                                                  categoryId: news.categoryId,
                                                  rootCategoryId:
                                                      news.rootCategoryId,
                                                  rootCategoryName:
                                                      news.rootCategoryName,
                                                ),
                                              ],
                                            )
                                          :
                                      NewsTile(
                                              // news.categoryDisplayName,
                                              categoryName:
                                                  news.categoryDisplayName,
                                              date: news.displayDate,
                                              title: news.headline,
                                              image: news.imageUrl,
                                              newsId: news.postId,
                                              categoryId: news.categoryId,
                                              rootCategoryName:
                                                  news.rootCategoryName),
                                      if (index == 0)
                                        ShowCaseAd1(
                                          rootCategoryName:
                                              news.rootCategoryName,
                                        ),

                                      if (index != 0 && index % 12 == 0)
                                        ShowCaseAd2(
                                            rootCategoryName:
                                                news.rootCategoryName),
                                    ],
                                  );
                                },
                              )

                                  // [
                                  //   // ListView.builder(
                                  //   //     // cacheExtent: sizeFromHeight(1),
                                  //   //     // shrinkWrap: true,
                                  //   //     // addAutomaticKeepAlives: true,
                                  //   //
                                  //   //     // controller: controller.scrollController,
                                  //   //     itemCount: controller.newsModel.result.length,
                                  //   //     itemBuilder: (context, index) {
                                  //   //       final news =
                                  //   //           controller.newsModel.result[index];
                                  //   //       // final mainCategories = CategoriesController
                                  //   //       //     .categoriesModel.result;
                                  //   //
                                  //   //     }),
                                  // ],
                                  ),
                            ),
                          ),
                        ),
                        if (state is NewsMoreLoading) LoadingIndicator(),
                      ],
                    ),
                    // if (controller.scrollController.hasClients &&
                    //     controller.scrollController.position.pixels != 10)
                    //   SponsorAd(widget.categoryId)
                  ],
                );
        },
      ),
    );
  }
}

/*
if(controller.scrollController.hasClients && controller.scrollController.position.pixels > 10)
                Positioned(
                  bottom: 0,
                  child: SponsorAd(),
                )
 */
