import 'package:flutter/material.dart';
import 'package:masrawy/core/googleAds/ad_model.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/googleAds/show_case_2.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';
import 'package:masrawy/views/search/view.dart';

class NewsDetailsKeywordSection extends StatefulWidget {
  @override
  _NewsDetailsKeywordSectionState createState() =>
      _NewsDetailsKeywordSectionState();
}

class _NewsDetailsKeywordSectionState extends State<NewsDetailsKeywordSection> {
  @override
  Widget build(BuildContext context) {
    final keywords =
        NewsDetailsController.get(context).newsDetailsModel.result.keywordsList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text('كلمات مفتاحية'),
        Wrap(
          children: keywords
              .map((e) => Padding(
                    padding: const EdgeInsets.only(left: 4, right: 10),
                    child: GestureDetector(
                        onTap: () => MagicRouter.navigateTo(SearchView(e.name)),
                        child: Chip(label: Text(e.name))),
                  ))
              .toList(),
        ),

        Divider(
          color: Colors.black54,
          height: 2,
        ),
        SizedBox(height: 30),
        Center(
          child: ShowCaseAd2(
            rootCategoryName: 'news',
          ),
        ),
      ],
    );
  }
}
