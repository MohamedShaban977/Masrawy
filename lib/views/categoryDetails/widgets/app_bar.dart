import 'package:flutter/material.dart';
import 'package:masrawy/widgets/tab_bar.dart';

categoryDetailsAppBar(String title,{List<String> tabs})=> AppBar(
  backgroundColor: Colors.black,
  title: Text(title,style: TextStyle(fontSize: 17),),
  centerTitle: false,
  titleSpacing: -10,
  // bottom: tabs.length <= 1 ? null : customTabBar(tabs,labelColor: Colors.white),
);