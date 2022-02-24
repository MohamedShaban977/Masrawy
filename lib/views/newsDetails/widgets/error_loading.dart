import 'package:flutter/material.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';

import '../../../constants.dart';

class NewsDetailsErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = NewsDetailsController.get(context);
    return GestureDetector(
      onTap: ()=> controller.getDetails(),
      child: Scaffold(
        body: Container(
          color: Colors.black87,
          width: double.infinity,
          height: sizeFromHeight(0,removeAppBarSize: false),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline ,color: Colors.white,size: sizeFromHeight(4),),
              Text('لا يوجد إتصال بالانترنت!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),),
              Text('اضغط للمحاولة!',style: TextStyle(color: Colors.white,fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }
}
