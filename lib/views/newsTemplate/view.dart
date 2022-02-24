import 'package:flutter/material.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/models/categories.dart';
import 'package:masrawy/widgets/custom_elevation.dart';
import 'package:masrawy/widgets/news_list.dart';
import 'package:masrawy/widgets/tab_bar.dart';

class NewsTemplateView extends StatefulWidget {
  final List<Result> tabs;
  final int mainCategoryId;
  NewsTemplateView({this.tabs, this.mainCategoryId});

  @override
  _NewsTemplateViewState createState() => _NewsTemplateViewState();
}

class _NewsTemplateViewState extends State<NewsTemplateView> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.tabs.length, vsync: this);
    CategoriesTabBarController.get(context).subTabController = tabController;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: widget.tabs.isEmpty ? 1 : widget.tabs.length,
      child: Scaffold(
        body: widget.tabs.isEmpty ? NewsList(widget.mainCategoryId) : Column(
          children: [
            // if(widget.tabs.isNotEmpty)
              Column(
                children: [
                  customTabBar(widget.tabs,context: context),
                  ElevationCard(),
                ],
              ),
            Expanded(
              child: TabBarView(

                controller: tabController,
                children: widget.tabs.map((e) => NewsList(e.categoryId)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}