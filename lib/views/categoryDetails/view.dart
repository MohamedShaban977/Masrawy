import 'package:flutter/material.dart';
import 'package:masrawy/core/dioHelper/api_helper.dart';
import 'package:masrawy/views/categoryDetails/widgets/app_bar.dart';
import 'package:masrawy/widgets/news_list.dart';

class CategoryDetailsView extends StatelessWidget {
  final List<String> tabs;
  final String title;
  final int initialIndex;
  CategoryDetailsView({this.tabs, this.title, this.initialIndex = 0});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: tabs.length,
      child: Scaffold(
        appBar: categoryDetailsAppBar(title,tabs: tabs),
        body: TabBarView(
          children: tabs.map((e) {
            final id = ApiHelper.getCategoryIdByName(e);
            return NewsList(id);
          }).toList(),
        ),
      ),
    );
  }
}
