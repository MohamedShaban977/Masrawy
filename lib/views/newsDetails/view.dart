import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';
import 'package:masrawy/views/newsDetails/cubits/sponsor_ad.dart';
import 'package:masrawy/views/newsDetails/states/controller.dart';
import 'package:masrawy/views/newsDetails/widgets/app_bar.dart';
import 'package:masrawy/views/newsDetails/widgets/news_details_listview.dart';
import 'package:masrawy/widgets/loading_indicator.dart';

import 'widgets/error_loading.dart';

class NewsDetailsView extends StatelessWidget {
  final int newsId;
  NewsDetailsView(this.newsId);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SponsorAdCubit(),),
        BlocProvider(create: (context) => NewsDetailsController(newsId: newsId)..getDetails()..scrollListener(context),),
      ],
      child: BlocBuilder<NewsDetailsController, NewsDetailsStates>(
        builder: (context, state) => Scaffold(
          appBar: newsDetailsAppBar(context),
          body: state is NewsDetailsLoading
              ? LoadingIndicator()
              : state is NewsDetailsError ? NewsDetailsErrorWidget() : NewsDetailsContentList(),
        ),
      ),
    );
  }
}