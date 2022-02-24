import 'dart:async';
import 'package:flutter/material.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/views/home/view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    getCategories();
    super.initState();
  }

  TabController tabController;

 Future <void> getCategories() async {
    await CategoriesController.get();
    Timer(
        Duration(milliseconds: 2500),
        () =>

            MagicRouter.navigateAndPopAll(HomeView(
              categoryId: 27,
              tabController: tabController,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          getAsset('loader.gif'),
        ),
      ),
    );
  }
}
