import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:masrawy/core/controllers/categories_tab_bar.dart';
import 'package:masrawy/core/models/categories.dart';
import '../constants.dart';

customTabBar(List<Result> tabs,
        {BuildContext context,
        // Color labelColor,
        isIndicatorTriangle = false}) =>
    TabBar(
      labelColor: Theme.of(context).tabBarTheme.labelColor,
      indicatorColor: kPrimaryColor,
      isScrollable: true,
      controller: isIndicatorTriangle
          ? CategoriesTabBarController.get(context).mainTabController
          : CategoriesTabBarController.get(context).subTabController,
      labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(
        fontSize: 13,
      ),
      indicatorWeight: 3,
      tabs: tabs
          .map((e) => Tab(
                text: e.name,
              ))
          .toList(),
      indicator: isIndicatorTriangle
          ? TriangleTabIndicator(color: Colors.redAccent)
          : null,
      indicatorSize: TabBarIndicatorSize.label,
    );

class TriangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  TriangleTabIndicator({@required Color color})
      : _painter = DrawTriangle(color);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class DrawTriangle extends BoxPainter {
  Paint _paint;

  DrawTriangle(Color color) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset triangleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - 10);
    var path = Path();

    path.moveTo(triangleOffset.dx, triangleOffset.dy);
    path.lineTo(triangleOffset.dx + 10, triangleOffset.dy + 10);
    path.lineTo(triangleOffset.dx - 10, triangleOffset.dy + 10);
    path.close();
    canvas.drawPath(path, _paint);
  }
}
