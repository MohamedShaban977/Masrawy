import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masrawy/core/googleAds/show_case_2.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/widgets/toast.dart';

const DefaultErrorMessage = 'حدث خطأ اثناء تنفيذ طلبكم!';

String getAsset(String asset) => 'assets/images/$asset';

void showDefaultErrorMessage({bool primaryColor = true}) =>
    showToast(DefaultErrorMessage, primaryColor: primaryColor);

const Color kPrimaryColor = Colors.red;
// const Color kAccentColor = Color(0xFF56D186);
// const Color kLPurpleColor = Color(0xFFD2599C);
const Color kGrayColor = Colors.black12;
const Color kLogoColorLight = Colors.black;
const Color kLogoColorDark = Colors.white;

ThemeData theme = ThemeData(
  platform: TargetPlatform.android,
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  // primaryColorLight: Colors.black,
  cardColor: kLogoColorLight,
  // accentColor: kAccentColor,
  // cursorColor: kPrimaryColor,
  // canvasColor: Colors.white.,
  fontFamily: 'greta',

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.grey),
    actionsIconTheme: IconThemeData(color: Colors.red),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.black87,
  ),
  textButtonTheme: TextButtonThemeData(
    style:
        ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
    subtitle1: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
    subtitle2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: TextStyle(fontSize: 15, color: Colors.black87),

    // body1: TextStyle(fontSize: 15,color: kPrimaryColor),
    // body2: TextStyle(fontSize: 15,color: kAccentColor),
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  platform: TargetPlatform.android,
  primaryColor: kPrimaryColor,
  cardColor: kLogoColorDark,
  fontFamily: 'greta',
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black26,
    iconTheme: IconThemeData(color: Colors.grey),
    actionsIconTheme: IconThemeData(color: Colors.red),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style:
        ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white70)),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 19, fontWeight: FontWeight.w900, color: Colors.white),
    subtitle1: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    subtitle2: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: TextStyle(fontSize: 15, color: Colors.white70),
    headline4: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
  ),
);




final containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    border: Border.all(color: Colors.black54, width: 0.2));

void closeKeyboard(context) => FocusScope.of(context).unfocus();

TextTheme get getTextTheme => Theme.of(navigatorKey.currentContext).textTheme;

double sizeFromHeight(double fraction, {bool removeAppBarSize = true}) {
  MediaQueryData mediaQuery = MediaQuery.of(navigatorKey.currentContext);
  fraction = (removeAppBarSize
          ? (mediaQuery.size.height -
              AppBar().preferredSize.height -
              mediaQuery.padding.top)
          : mediaQuery.size.height) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(double fraction) {
  fraction = MediaQuery.of(navigatorKey.currentContext).size.width /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}
