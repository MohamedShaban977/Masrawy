import 'package:flutter/material.dart';
import 'package:flutter_google_ad_manager/ad_size.dart';
import 'package:flutter_google_ad_manager/banner.dart';

import 'ad_model.dart';
import 'channel_id_helper.dart';

class LeaderBoardAd1 extends StatefulWidget {
  final rootCategoryName;

  LeaderBoardAd1({this.rootCategoryName });
  @override
  _LeaderBoardAd1State createState() => _LeaderBoardAd1State();
}

class _LeaderBoardAd1State extends State<LeaderBoardAd1> {
  GoogleAdChannelIdHelper _googleAdChannelIdHelper = GoogleAdChannelIdHelper();

  Future<AdModel> _futureGetLeaderBoard1;

  bool isFailed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeaderBoard1();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future<void> getLeaderBoard1() async {
    _futureGetLeaderBoard1 = _googleAdChannelIdHelper.getAdUnit(
        GoogleAdChannelIdHelper.mapCategoriesToChannel[widget.rootCategoryName],
        GoogleAdChannelIdHelper.leaderBoardTypeId1);
  }

  @override
  Widget build(BuildContext context) {
    return isFailed
        ? Text('')
        : FutureBuilder<AdModel>(
            future: _futureGetLeaderBoard1,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print(snapshot.data.codeText);

                return DFPBanner(
                  isDevelop: false,
                  adUnitId: snapshot.data.codeText,
                  adSize: DFPAdSize.BANNER,
                  onAdLoaded: () {
                    print('Banner onAdLoaded');
                  },
                  onAdFailedToLoad: (errorCode) {
                    print('Banner onAdFailedToLoad: errorCode:$errorCode');
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
              }
              print(snapshot.error.toString());
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(child: Text('')),
              );
            },
          );
  }
}
