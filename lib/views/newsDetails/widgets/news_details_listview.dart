import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/googleAds/sponsor.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';
import 'package:masrawy/views/newsDetails/cubits/sponsor_ad.dart';
import 'package:masrawy/widgets/refresh_indicator.dart';
import 'details_section.dart';
import 'keywords_section.dart';
import 'related_news_section.dart';

class NewsDetailsContentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = NewsDetailsController.get(context);
    return CustomRefreshIndicator(
      onRefresh: controller.getDetails,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  NewsDetailsDetailsSection(),
                  NewsDetailsKeywordSection(),
                  RelatedNewsSection(),
                ],
              ),
            ),
          ),
          if (controller.scrollController.hasClients &&
              controller.scrollController.position.pixels > 0)
            BlocBuilder(
                cubit: SponsorAdCubit.get(context),
                builder: (context, state) => Positioned(
                    bottom: 0,
                    child: SponsorAd(
                        controller.newsDetailsModel.result.categoryId))),
        ],
      ),
    );
  }
}
