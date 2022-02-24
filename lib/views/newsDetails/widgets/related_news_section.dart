import 'package:flutter/cupertino.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/googleAds/ad_model.dart';
import 'package:masrawy/core/googleAds/channel_id_helper.dart';
import 'package:masrawy/core/googleAds/show_case_2.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';
import 'package:masrawy/widgets/news_tile.dart';

class RelatedNewsSection extends StatefulWidget {
  @override
  _RelatedNewsSectionState createState() => _RelatedNewsSectionState();
}

class _RelatedNewsSectionState extends State<RelatedNewsSection> {
  GoogleAdChannelIdHelper _googleAdChannelIdHelper = GoogleAdChannelIdHelper();

  Future<AdModel> _futuregetAdShowCase2;

  String adModelShowCase;
  getAdShowCase() async {
    await _googleAdChannelIdHelper.getAdUnit(
        GoogleAdChannelIdHelper.mapCategoriesToChannel[23],
        GoogleAdChannelIdHelper.showCase2TypeId);
    _futuregetAdShowCase2 = _googleAdChannelIdHelper.getAdUnit(
        GoogleAdChannelIdHelper.mapCategoriesToChannel[23],
        GoogleAdChannelIdHelper.showCase2TypeId);
    // adModelShowCase = _googleAdChannelIdHelper.textCode;
    return adModelShowCase;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAdShowCase();
  }

  @override
  Widget build(BuildContext context) {
    final details = NewsDetailsController.get(context).newsDetailsModel.result;
    final news = details.relatedArticles;
    return news == null || news.isEmpty
        ? Text('')
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'الاخبار المتعلقة',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
              ...news
                  .map((e) => NewsTile(
                        categoryName: e.categoryName,
                        date: e.displayDate,
                        title: e.headline,
                        image: e.imageUrl,
                        newsId: e.postId,
                      ))
                  .toList(),
            ],
          );
  }
}
