import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:masrawy/core/googleAds/ad_model.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/googleAds/interstitial.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:masrawy/core/googleAds/leaderboard_1.dart';
import 'package:masrawy/core/googleAds/show_case_1.dart';
import 'package:masrawy/core/googleAds/show_case_2.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';
import 'package:masrawy/views/newsDetails/states/controller.dart';
import 'package:masrawy/views/newsDetails/widgets/album.dart';
import 'package:masrawy/views/newsDetails/widgets/slider_dialog.dart';
import '../../../constants.dart';

class NewsDetailsDetailsSection extends StatefulWidget {
  @override
  _NewsDetailsDetailsSectionState createState() =>
      _NewsDetailsDetailsSectionState();
}

class _NewsDetailsDetailsSectionState extends State<NewsDetailsDetailsSection> {
  @override
  Widget build(BuildContext context) {
    final details = NewsDetailsController.get(context).newsDetailsModel.result;
    print(details.postId);
    print(details.body);
    return LayoutBuilder(builder: (context, con) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: height * 0.015, top: height * 0.01),
              child: LeaderBoardAd1(
                rootCategoryName: details.rootCategoryName,
              ),
            ),
            Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: getAsset('logoo.png'),
                  image: details.imageUrl,
                  height: sizeFromHeight(2.5),
                  width: sizeFromWidth(0.1),
                  fit: BoxFit.fill,
                ),
                if (details.postAlbum.isNotEmpty)
                  Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                    insetPadding: EdgeInsets.all(10),
                                    backgroundColor: Colors.transparent,
                                    child: NewsAlbum(images: details.postAlbum),
                                    elevation: 0,
                                  ),
                                );
                              },
                              child: Text('عرض الصور')))),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  details.categoryName,
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  details.displayDate,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      details.headline,
                      textAlign: TextAlign.start,
                      style: getTextTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            ),
            ShowCaseAd1(
              rootCategoryName: details.rootCategoryName,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: sizeFromWidth(0.1),
                child: Html(
                  data: details.body,
                  style: {
                    "body": Style(
                      fontSize: FontSize(16.0),
                      letterSpacing: 4,
                      lineHeight: LineHeight.number(1.5),
                      fontWeight: FontWeight.w500,
                    ),
                  },
                ),
              ),
            ),
            Divider(),
          ],
        ),
      );
    });
  }
}
