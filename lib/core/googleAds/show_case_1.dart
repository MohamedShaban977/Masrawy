import 'package:flutter/material.dart';
import 'package:flutter_google_ad_manager/flutter_google_ad_manager.dart';
import 'package:masrawy/core/googleAds/ad_model.dart';

import 'channel_id_helper.dart';

class ShowCaseAd1 extends StatefulWidget {
  final rootCategoryName;

  ShowCaseAd1({this.rootCategoryName });

  @override
  _ShowCaseAd1State createState() => _ShowCaseAd1State();
}

class _ShowCaseAd1State extends State<ShowCaseAd1> {
  bool isFailed = false;
  GoogleAdChannelIdHelper _googleAdChannelIdHelper = GoogleAdChannelIdHelper();
  Future<AdModel> _futuregetAdShowCase1;

  getShowCase1() async {
    // if (_futuregetAdShowCase1 != null) return;

    _futuregetAdShowCase1 = _googleAdChannelIdHelper.getAdUnit(
        GoogleAdChannelIdHelper.mapCategoriesToChannel[widget.rootCategoryName],
        GoogleAdChannelIdHelper.showCase1TypeId);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('rootCategoryName' + widget.rootCategoryName);
    // print(GoogleAdChannelIdHelper
    //     .mapCategoriesToChannel[widget.rootCategoryName]
    //     .toString());
    getShowCase1();
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isFailed
        ? Text('')
        : Column(
            children: [
              Text('اعلان'),
              FutureBuilder<AdModel>(
                  future: _futuregetAdShowCase1,
                  builder: (context, snapshot) {
                    // print(snapshot.data);

                    if (snapshot.hasData) {
                      return DFPBanner(
                        isDevelop: false,
                        adUnitId: snapshot.data.codeText,
                        adSize: DFPAdSize.MEDIUM_RECTANGLE,
                        onAdLoaded: () {
                          print('Banner onAdLoaded');
                        },
                        onAdFailedToLoad: (errorCode) {
                          print(
                              'Banner onAdFailedToLoad: errorCode:$errorCode');
                          if (!isFailed)
                            setState(() {
                              isFailed = true;
                            });
                        },
                        onAdOpened: () {
                          print('Banner onAdOpened');
                        },
                        onAdClosed: () {
                          print('Banner onAdClosed');
                        },
                        onAdLeftApplication: () {
                          print('Banner onAdLeftApplication');
                        },
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    return Text('');
                  }),
            ],
          );
  }
}
