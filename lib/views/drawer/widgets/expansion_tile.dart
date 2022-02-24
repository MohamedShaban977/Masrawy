import 'package:flutter/material.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/core/models/categories.dart';

class CustomExpansionTile extends StatelessWidget {
  final Result mainCategory;
  final List<Result> subCategories;
  final bool isExpanded;
  final Function onChanged;
  CustomExpansionTile(
      {Key key,
      this.mainCategory,
      this.subCategories,
      this.isExpanded = false,
      this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: key,
      initiallyExpanded: isExpanded,
      // backgroundColor: Colors.blue,

      title: Text(
        mainCategory.name,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      // collapsedBackgroundColor: Colors.amber,
      tilePadding: EdgeInsets.symmetric(horizontal: 10),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: subCategories
              .map((e) =>
                  _textButton(e.name, context, index: subCategories.indexOf(e)))
              .toList(),
        )
      ],

      onExpansionChanged: (v) {
        onChanged(v);
        if (v && subCategories.isEmpty)
          CategoriesTabBarController.get(context).navigateTo(
              CategoriesController.categoriesModel.result.indexOf(mainCategory),
              0);
      },
    );
  }

  Widget _textButton(String title, context, {int index = 0}) {
    return TextButton(
        onPressed: () => CategoriesTabBarController.get(context).navigateTo(
            CategoriesController.categoriesModel.result.indexOf(mainCategory),
            index),
        child: Row(
          children: [
            Text(
              title,
            ),
            Spacer(
            ),
          ],
        ));
  }
}
