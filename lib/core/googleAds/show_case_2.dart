import 'package:flutter/material.dart';
import 'package:flutter_google_ad_manager/ad_size.dart';
import 'package:flutter_google_ad_manager/banner.dart';

import 'ad_model.dart';
import 'channel_id_helper.dart';

class ShowCaseAd2 extends StatefulWidget {
  final rootCategoryName;

  ShowCaseAd2({this.rootCategoryName}) ;

  @override
  _ShowCaseAd2State createState() => _ShowCaseAd2State();
}

class _ShowCaseAd2State extends State<ShowCaseAd2> {
  bool isFailed = false;
  GoogleAdChannelIdHelper _googleAdChannelIdHelper = GoogleAdChannelIdHelper();
  Future<AdModel> _futureGetAdShowCase2;

  getShowCase2() {
    if (_futureGetAdShowCase2 != null) return;

    _futureGetAdShowCase2 = _googleAdChannelIdHelper.getAdUnit(
        GoogleAdChannelIdHelper.mapCategoriesToChannel[widget.rootCategoryName],
        GoogleAdChannelIdHelper.showCase2TypeId);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShowCase2();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    getShowCase2();

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
                  future: _futureGetAdShowCase2,
                  builder: (contect, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('');
                    }
                    return DFPBanner(
                      isDevelop: false,
                      adUnitId: snapshot.data.codeText,
                      adSize: DFPAdSize.MEDIUM_RECTANGLE,
                      onAdLoaded: () {
                        print('Banner onAdLoaded');
                      },
                      onAdFailedToLoad: (errorCode) {
                        print('Banner onAdFailedToLoad: errorCode:$errorCode');
                        if (!isFailed) {
                          setState(() {
                            isFailed = true;
                          });
                        }
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
                  }),
            ],
          );
  }
}
