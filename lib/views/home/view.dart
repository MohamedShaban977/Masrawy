import 'package:flutter/material.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/controllers/categoris.dart';
import 'package:masrawy/views/drawer/view.dart';
import 'package:masrawy/views/newsTemplate/view.dart';
import 'package:masrawy/widgets/home_app_bar.dart';

class HomeView extends StatefulWidget {
  TabController tabController;
   final int categoryId;
  HomeView({this.tabController,this.categoryId});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  // TabController tabController;

  @override
  void initState() {
    super.initState();
   widget.tabController = TabController(length: CategoriesController.categoriesModel.result.length, vsync: this);
    CategoriesTabBarController.get(context).mainTabController =widget.tabController;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    widget.tabController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CategoriesController.categoriesModel.result.length,
      child: Scaffold(
        appBar: homeAppBar(context),
        drawer: DrawerView(),
        body: TabBarView(

            controller:widget.tabController,
            children: CategoriesController.categoriesModel.result.toList().map((e) => NewsTemplateView(
            tabs: e.childrenList,
              mainCategoryId: widget.categoryId==null? e.categoryId :widget.categoryId,
        ),).toList()

        ),
      ),
    );
  }
}