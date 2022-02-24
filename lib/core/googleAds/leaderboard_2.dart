import 'package:flutter/material.dart';
import 'package:flutter_google_ad_manager/ad_size.dart';
import 'package:flutter_google_ad_manager/banner.dart';

import 'ad_model.dart';
import 'channel_id_helper.dart';

class LeaderBoardAd1 extends StatefulWidget {
  @override
  _LeaderBoardAd1State createState() => _LeaderBoardAd1State();
}

class _LeaderBoardAd1State extends State<LeaderBoardAd1> {
  GoogleAdChannelIdHelper _googleAdChannelIdHelper = GoogleAdChannelIdHelper();

  Future<AdModel> _futureGetLeaderBoard2;

  bool isFailed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeaderBoard2();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    getLeaderBoard2();

    super.dispose();
  }
  Future<void> getLeaderBoard2() async {
    _futureGetLeaderBoard2 = _googleAdChannelIdHelper.getAdUnit(
        GoogleAdChannelIdHelper.mapCategoriesToChannel[GoogleAdChannelIdHelper.news],
        GoogleAdChannelIdHelper.leaderBoardTypeId2);
  }

  @override
  Widget build(BuildContext context) {
    return isFailed
        ? Text('')
        : FutureBuilder<AdModel>(
            future: _futureGetLeaderBoard2,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('else banner');
              }
              return DFPBanner(
                isDevelop: false,
                adUnitId: snapshot.data.codeText,
                adSize: DFPAdSize.FULL_BANNER,
                onAdLoaded: () {
                  print('Banner onAdLoaded');
                },
                onAdFailedToLoad: (errorCode) {
                  print('Banner onAdFailedToLoad: errorCode:$errorCode');
                  if (!isFailed)setState(() {
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
            },
          );
  }
}
