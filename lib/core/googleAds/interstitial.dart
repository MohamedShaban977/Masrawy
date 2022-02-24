import 'package:flutter/material.dart';
import 'package:flutter_google_ad_manager/interstitial_ad.dart';
import 'package:masrawy/core/googleAds/ad_model.dart';

// class InterstitialAd {
//   final String adUnitId;
//   InterstitialAd(this.adUnitId);
//
//   void showAd(){
//     if(adUnitId == null ) return;
//     _interstitialAd = DFPInterstitialAd(
//       isDevelop: false,
//       adUnitId: adUnitId,
//       onAdLoaded: () {
//         print('interstitialAd onAdLoaded');
//         _interstitialAd.show();
//       },
//       onAdFailedToLoad: (errorCode) {
//         print('interstitialAd onAdFailedToLoad: errorCode:$errorCode');
//       },
//       onAdOpened: () {
//         print('interstitialAd onAdOpened');
//       },
//       onAdClosed: () {
//         print('interstitialAd onAdClosed');
//       },
//       onAdLeftApplication: () {
//         print('interstitialAd onAdLeftApplication');
//       },
//     );
//     _interstitialAd.load();
//   }
//
//
//
//
// }
// class InterstitialAd1 extends StatefulWidget {
//   @override
//   _InterstitialAd1State createState() => _InterstitialAd1State();
// }
//
// class _InterstitialAd1State extends State<InterstitialAd1> {
//   DFPInterstitialAd _interstitialAd;
//
//    showAd(adUnitId){
//     _interstitialAd = DFPInterstitialAd(
//       isDevelop: false,
//       adUnitId: adUnitId,
//       onAdLoaded: () {
//         print('interstitialAd onAdLoaded');
//         _interstitialAd.show();
//       },
//       onAdFailedToLoad: (errorCode) {
//         print('interstitialAd onAdFailedToLoad: errorCode:$errorCode');
//       },
//       onAdOpened: () {
//         print('interstitialAd onAdOpened');
//       },
//       onAdClosed: () {
//         print('interstitialAd onAdClosed');
//       },
//       onAdLeftApplication: () {
//         print('interstitialAd onAdLeftApplication');
//       },
//     );
//     _interstitialAd.load();
//
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _interstitialAd.show();
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _interstitialAd.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     _interstitialAd.show();
//
//     return FutureBuilder<AdModel>(builder: (context ,snapshot){
//       if(!snapshot.hasData){
//       return null;}
//       return showAd(snapshot.data.codeText);
//     });
//   }
// }
