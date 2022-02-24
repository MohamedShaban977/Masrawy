import 'package:flutter/material.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/core/dioHelper/api_helper.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/test_screen.dart';
import 'package:masrawy/views/search/view.dart';
import 'package:masrawy/widgets/tab_bar.dart';

homeAppBar(BuildContext context) => AppBar(
      title: GestureDetector(
        onTap: () {
          // print('مصراوي');
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => TestScreen()));
          CategoriesTabBarController.get(context)
              .navigateToLogoHomeScreen(3633);
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                getAsset('logoImage2.png'),
                // color: Colors.white,
                height: 40,
                // width: sizeFromWidth(3),
              ),
              Image.asset(
                getAsset('logoText.png'),
                color: Theme.of(context).cardColor,
                height: 40,
                // width: sizeFromWidth(3),
              ),
            ],
          ),
        ),
      ),
      // elevation: 0,
      // backgroundColor: Colors.white12,
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () => MagicRouter.navigateTo(SearchView()))
      ],
      leading: Builder(
          builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: kPrimaryColor,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )),
      bottom: customTabBar(CategoriesController.categoriesModel.result,
          context: context, isIndicatorTriangle: true),
    );
