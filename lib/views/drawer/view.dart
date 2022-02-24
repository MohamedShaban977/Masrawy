import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/views/drawer/widgets/expansion_tile.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  int _expandedIndex = -1;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeFromWidth(6)),
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
            Expanded(
                child: ListView.builder(
              itemCount: CategoriesController.categoriesModel.result.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                final mainCategories =
                    CategoriesController.categoriesModel.result;
                // final subCategoriesTitles = ApiHelper.allNews.values.toList()[index].keys.toList();
                return CustomExpansionTile(
                  mainCategory: mainCategories[index],
                  subCategories: mainCategories[index].childrenList,
                  isExpanded: _expandedIndex == index,
                  onChanged: (v) {
                    setState(
                        () => v ? _expandedIndex = index : _expandedIndex = -1);
                    scrollController.jumpTo(index + 0.0);
                  },
                  key: Key(Random().nextInt(99999999).toString()),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
