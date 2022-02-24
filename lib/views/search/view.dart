import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/core/googleAds/ad_model.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/googleAds/leaderboard_1.dart';
import 'package:masrawy/core/googleAds/show_case_1.dart';
import 'package:masrawy/core/googleAds/show_case_2.dart';
import 'package:masrawy/views/search/cubits/controller.dart';
import 'package:masrawy/views/search/states/controller.dart';
import 'package:masrawy/views/search/widgets/search_field.dart';
import 'package:masrawy/widgets/loading_indicator.dart';
import 'package:masrawy/widgets/news_tile.dart';

class SearchView extends StatefulWidget {
  final String keyword;
  SearchView([this.keyword]);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchController(widget.keyword)..scrollListener(),
      child: Scaffold(
        body: BlocBuilder<SearchController, SearchStates>(
          builder: (context, state) {
            final controller = SearchController.get(context);
            return Scaffold(
              appBar: AppBar(title: SearchField()),
              body: state is SearchLoading
                  ? LoadingIndicator()
                  : controller.searchResultModel == null ||
                          controller.searchResultModel.result.isEmpty
                      ? Center(child: Text('لا توجد نتائج!'))
                      : Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                    controller: controller.scrollController,
                                    child: Column(
                                        children: List.generate(
                                            controller.searchResultModel.result
                                                .length, (index) {
                                          final news = controller
                                              .searchResultModel.result[index];
                                      return Column(
                                        children: [
                                          index == 0
                                              ? LeaderBoardAd1(
                                                  rootCategoryName:
                                                      GoogleAdChannelIdHelper
                                                          .ROS)
                                              : NewsTile(
                                                  categoryName:
                                                      news.categoryDisplayName,
                                                  date: news.displayDate,
                                                  title: news.headline,
                                                  image: news.imageUrl,
                                                  newsId: news.postId,
                                                  categoryId: news.categoryId,
                                                  isSearch: true,
                                                ),
                                          if (index == 4)
                                            ShowCaseAd1(
                                                rootCategoryName:
                                                    GoogleAdChannelIdHelper
                                                        .ROS),
                                        ],
                                      );
                                    })),
                                  ),

                            ),
                            if (state is SearchMoreLoading) LoadingIndicator(),
                          ],
                        ),
            );
          },
        ),
      ),
    );
  }
}
